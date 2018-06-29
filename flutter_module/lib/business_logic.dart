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

  void _playVideo(GalleryItem item){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(2.0),
      child: new Column(
        children: <Widget>[
          new Text("Child List Goeth Here"),
          new Expanded(
              child: new ListView.builder(
              itemBuilder: (context, index){
                GalleryItem item = imageUrls[index];
                return new Stack(
                  alignment: Alignment(0.0, 0.0),
                  children: <Widget>[
                    new Container(
                    height: 300.0,
                      width: 300.0,
                      margin: new EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 2.0
                      ),
                      child: new Column(
                        children: <Widget>[
                          Expanded(child:Image.network(item.url)),
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                item.description,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              )
                            ],),
                        ],
                      ),
                    ),
                    new Container(
                      child: new Card(
                        color:Color.fromARGB(150, 255, 255, 255),
                        child:new IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: (){
                            _playVideo(item);
                          },
                          iconSize: 65.0,
                        ),
                      )
                    )
                  ],
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
