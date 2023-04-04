import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pow/api.dart';
import 'package:pow/constants.dart';
import 'package:pow/kmlCode.dart';
import 'package:pow/models.dart';
import 'package:ssh2/ssh2.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  LGConnection? lgConnection;
  TextEditingController username = TextEditingController();
  TextEditingController ipAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController portNumber = TextEditingController();
  TextEditingController numberOfMachines = TextEditingController();

  Future<LGConnection?> connectToLG() async {
    final LGConnection conn;
    try {
      conn = LGConnection(
        username: username.text,
        ipAddress: ipAddress.text,
        password: password.text,
        portNumber: int.tryParse(portNumber.text)!.toInt(),
        numberOfMachines: int.tryParse(numberOfMachines.text)!.toInt(),
      );
      await conn.client.connect();

      // log(createMarkersFromApi());
      log(conn.username);
      log(conn.password);
      log(conn.portNumber.toString());
      log(conn.ipAddress);
      log(conn.numberOfMachines.toString());

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Connected Successfully!")));
      await conn.client.disconnect();
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$e")));
      return null;
    }
    return conn;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, lgConnection);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Connection Configuration",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Master Machine Username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: ipAddress,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Master Machine IP",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: portNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Master Machine Port",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Master Machine Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: numberOfMachines,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Total Machines",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                onPressed: () async {
                  lgConnection = await connectToLG();
                },
                elevation: 0,
                child: Text(
                  "Connect",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class LGConnection {
  final String username;
  final String ipAddress;
  final String password;
  final int portNumber;
  final int numberOfMachines;
  late SSHClient client;
  LGConnection({
    required this.username,
    required this.ipAddress,
    required this.password,
    required this.portNumber,
    required this.numberOfMachines,
  }) {
    client = SSHClient(
      host: ipAddress,
      port: portNumber,
      username: username,
      passwordOrKey: password,
    );
  }
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  _createLocalFile(String kml, String projectname) async {
    String localPath = await _localPath;
    File localFile = File('$localPath/$projectname.kml');
    localFile.writeAsString(kml);

    return _uploadToLG('$localPath/$projectname.kml', projectname);
  }

  cleanKML() async {
    await client.connect();
    await client.execute('> /var/www/html/kmls.txt');
    await client.disconnect();
  }

  _uploadToLG(String localPath, String projectname) async {
    LookAt flyto = LookAt(
      79.101568,
      7.406994,
      '${7500000.9978371 / numberOfMachines}',
      '45',
      '0',
    );
    try {
      await client.connect();
      await client.execute('> /var/www/html/kmls.txt');

      // upload kml
      await client.connectSFTP();
      await client.sftpUpload(
        path: localPath,
        toPath: '/var/www/html',
        callback: (progress) {
          print('Sent $progress');
        },
      );
      File(localPath).deleteSync();
      await client.execute(
          'echo "http://lg1:81/$projectname.kml" > /var/www/html/kmls.txt');

      await client.execute(
          'echo "flytoview=${flyto.generateLinearString()}" > /tmp/query.txt');
      await client.disconnect();
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  Future sendToLG(String kml, String projectname) async {
    if (kml.isNotEmpty) {
      return _createLocalFile(kml, projectname);
    }
    return Future.error('nogeodata');
  }
}

class LookAt {
  double lng;
  double lat;
  String range;
  String tilt;
  String heading;

  LookAt(this.lng, this.lat, this.range, this.tilt, this.heading);

  generateTag() {
    return '''
       <LookAt>
        <longitude>${this.lng}</longitude>
        <latitude>${this.lat}</latitude>
        <range>${this.range}</range>
        <tilt>${this.tilt}</tilt>
        <heading>${this.heading}</heading>
        <gx:altitudeMode>relativeToGround</gx:altitudeMode>
      </LookAt>
    ''';
  }

  generateLinearString() {
    return '<LookAt><longitude>${this.lng}</longitude><latitude>${this.lat}</latitude><range>${this.range}</range><tilt>${this.tilt}</tilt><heading>${this.heading}</heading><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>';
  }

  toMap() {
    return {
      "lng": lng,
      "lat": lat,
      "range": range,
      "tilt": tilt,
      "heading": heading,
    };
  }

  static fromMap(dynamic map) {
    return LookAt(
        map['lng'], map['lat'], map['range'], map['tilt'], map['heading']);
  }

  @override
  String toString() {
    return super.toString();
  }
}

createKMLFolder(String child) {
  return '''
	
	<Folder id="Vessels">
		<open>1</open>
    
		$child
    
		
	</Folder>''';
}

createMountedKML(String name, String content) {
  return '''
<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
            <name>Network Links</name>
          <visibility>0</visibility>
          <open>0</open>
          <description>Network link example 2</description>
          <NetworkLink>
            <name>View Centered Placemark</name>
            <visibility>0</visibility>
            <open>0</open>
            <description>The view-based refresh allows the remote server to calculate
                the center of your screen and return a placemark.</description>
            <refreshVisibility>0</refreshVisibility>
            <flyToView>0</flyToView>
            <Link>
              <href>http://lg1/cgi-bin/viewCenteredPlacemark.py</href>
              <refreshInterval>2</refreshInterval>
              <viewRefreshMode>onStop</viewRefreshMode>
              <viewRefreshTime>1</viewRefreshTime>
            </Link>
          </NetworkLink>
      <name>$name</name>
        $content
    </Document>
  </kml>
''';
}
