import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class screen extends StatefulWidget {
  final String imgurl;
  //  const screen({Key? key,required this.imgurl}) : super(key: key);
  screen({required this.imgurl});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
//  Future<void> setwallpaper() async {
//     int location = WallpaperManager.HOME_SCREEN;
//     var file = await DefaultCacheManager().getSingleFile(widget.imgurl);
//     String result = await WallpaperManager.setWallpaperFromFile(file.path, location);
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Text(
                'WallPaper',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'App',
                style: TextStyle(color: Colors.blue[800], fontSize: 20),
              ),
            ],
          )),
      body: Container(
          child: Column(
            children: [
              
              //Container(color: Colors.white,height: 10,),
              Expanded(
                  child: Container(
                    child: Image.network(widget.imgurl),
                  )),
              InkWell(
                onTap: () async {
                  await GallerySaver.saveImage(widget.imgurl);
                 // / savei();
                  // setwallpaper();
                  //    try {
                  //    var Imagid = await ImageDownloader.downloadImage(widget.imgurl);
                  //      var size = await ImageDownloader.findByteSize(Imagid??"11");
                  //      print(size!.toInt());
                  //  } on PlatformException catch (error) {
                  //      print(error);
                  //    }
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  color: Colors.black,
                  height: 60,
                  width: double.infinity,
                ),
              ),
            ],
          )),
    );
  }
}
