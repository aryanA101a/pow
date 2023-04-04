import 'models.dart';

String createMarker({
  required String iconUrl,
  required String name,
  required LngLat coordinates,
  required num direction,
  required double scale,
}) {
  return '''<Placemark id="ID_00000">
			<name>$name</name>
			
			
			<Style>
      <IconStyle>
        <Icon>
          <href>$iconUrl</href>
        </Icon>
        <heading>$direction</heading>
        <scale>0.8</scale>
      </IconStyle>
    </Style>

			<Point>
      <altitudeMode>relativeToGround</altitudeMode>
				<coordinates>${coordinates.longitude},${coordinates.latitude},30</coordinates>
			</Point>
		</Placemark>''';
}
