import 'package:flutter/material.dart';

class GalleryChooser extends StatefulWidget {
  @override
  _GalleryChooserState createState() => _GalleryChooserState();
}

class _GalleryChooserState extends State<GalleryChooser> {

  List<String> imageUrls = new List<String>();



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: new Column(
        children: <Widget>[
          new Text("Child List Goeth Here")
        ],
      )
    );
  }
}
