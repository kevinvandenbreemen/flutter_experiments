import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  static const String CHANNEL = "gemini";
  static const BasicMessageChannel<String> gemini = const BasicMessageChannel(CHANNEL, StringCodec());

  int _contactCount = 0;

  Future<String> _handler(String message) async{
    print("Received Message from Android App:  ${message}");
    setState(()=>_contactCount++);
    return "";
  }

  List<GalleryItem> imageUrls = new List<GalleryItem>();

  @override
  void initState() {
    imageUrls.add(GalleryItem(
      "https://images.pexels.com/photos/917476/pexels-photo-917476.jpeg",
      "Typewriter"
    ));
    imageUrls.add(GalleryItem(
        "https://cdn.pixabay.com/photo/2015/03/16/10/59/sunset-675847_960_720.jpg",
        "Pirate Ship"
    ));
    imageUrls.add(GalleryItem(
      "https://cdn.pixabay.com/photo/2018/06/24/03/06/ship-3493887_960_720.jpg",
      "Boat"
    ));
    imageUrls.add(GalleryItem(
        "https://images.pexels.com/photos/1024994/pexels-photo-1024994.jpeg",
        "Sunset"
    ));

    gemini.setMessageHandler(_handler);
  }

  void _playVideo(GalleryItem item){
    print("Sending Message to Android App");
    gemini.send(item.description);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(2.0),
      child: new Column(
        children: <Widget>[
          new Text("Signals From Android App:  $_contactCount"),
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
                          Expanded(child: Image.network(
                            item.url
                          )),
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
