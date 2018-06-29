import 'package:flutter/material.dart';

class GalleryChooser extends StatefulWidget {
  @override
  _GalleryChooserState createState() => _GalleryChooserState();
}

class GalleryItem{
  final String url;
  final String description;

  GalleryItem(this.url, this.description);

}



class _GalleryChooserState extends State<GalleryChooser> {

  List<GalleryItem> imageUrls = new List<GalleryItem>();

  @override
  void initState() {
    imageUrls.add(GalleryItem(
      "https://images.pexels.com/photos/917476/pexels-photo-917476.jpeg",
      "Typewriter"
    ));
    imageUrls.add(GalleryItem(
        "https://images.pexels.com/photos/730896/pexels-photo-730896.jpeg",
        "Cat"
    ));
    imageUrls.add(GalleryItem(
        "https://images.pexels.com/photos/1024994/pexels-photo-1024994.jpeg",
        "Sunset"
    ));

  }

  void onSelectUrl(String url){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: new Column(
        children: <Widget>[
          new Text("Child List Goeth Here"),
          new Expanded(
              child: new ListView.builder(
              itemBuilder: (context, index){
                GalleryItem item = imageUrls[index];
                return new Container(
                  height: 120.0,
                  margin: new EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Text(item.description),
                      Expanded(child:Image.network(item.url))
                    ],
                  ),
                );
              },
              itemCount: imageUrls.length,
          )
          )

        ],
      )
    );
  }
}
