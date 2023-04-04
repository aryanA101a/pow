import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pow/api.dart';
import 'package:pow/settings.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LGConnection? lgConnection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proof of Work"),
        actions: [
          IconButton(
              onPressed: () async {
                lgConnection = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ));
                log(lgConnection.toString());
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                onPressed: () async {
                  if (lgConnection != null) {
                    String kmlFolder = createKMLFolder(createMarkersFromApi());
                    String kml = createMountedKML("zenku", kmlFolder);
                    // await lgConnection?.cleanKML();
                    await lgConnection?.sendToLG(kml, "zenku");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Marked Successfully!")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Not Connected!")));
                  }
                },
                child: Text(
                  "Mark Vessels Near Kanyakumari",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
            ),
            MaterialButton(
              onPressed: () async {
                if (lgConnection != null) {
                  await lgConnection?.cleanKML();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Cleaned Successfully!")));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Not Connected!")));
                }
              },
              child: Text(
                "Clean LG",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
