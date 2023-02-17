import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/screen.dart';

class wallpaper extends StatefulWidget {
  // const wallpaper({super.key});
  // @override

  @override
  State<wallpaper> createState() => _wallpaperState();
}

class _wallpaperState extends State<wallpaper> {
  //TextEditingController c = TextEditingController();
  List images = [];
  int page = 1;
  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=40'),
        headers: {
          'Authorization':
              '563492ad6f917000010000010a6e9c8baa2544438552f37b9de135ee'
        }).then((value) {
      //print(value.body);
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      print(images);
    });
  }

  lodemore() async {
    setState(() {
      page++;
    });
    String url =
        // ignore: prefer_interpolation_to_compose_strings
        'https://api.pexels.com/v1/curated?per_page=80&page' + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f917000010000010a6e9c8baa2544438552f37b9de135ee'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll((result['photos']));
      });
    });
  }

  // search() async {
  //   String url =
  //       // ignore: prefer_interpolation_to_compose_strings
  //       "https://api.pexels.com/v1/search?query=$c.text&per_page=30&page=1";
  //   await http.get(Uri.parse(url), headers: {
  //     'Authorization':
  //         '563492ad6f917000010000010a6e9c8baa2544438552f37b9de135ee'
  //   }).then((value) {
  //     Map result = jsonDecode(value.body);
  //     setState(() {
  //       images.addAll((result['photos']));
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }

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
      body: Column(
        children: [
          // TextField(
          //       controller: c,
          //       decoration: InputDecoration(hintText: 'Search...'),
          //       onTap: () => search(),
          //     ),
          //  SearchBar(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     TextField(
          //       controller: c,
          //       decoration: InputDecoration(hintText: 'Search...'),
          //     ),
          //     InkWell(
          //       child: Icon(Icons.search),
          //       onTap: () {
          //         search();
          //       },
          //     )
          //   ],
          // ),
          Expanded(
              child: Container(
            child: GridView.builder(
                itemCount: images.length,
                // ignore: prefer_const_constructors
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 4,
                    crossAxisCount: 4,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 4),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screen(
                                    imgurl: images[index]['src']['large2x'],
                                  )));
                    },
                    child: Container(
                      child: Image.network(
                        images[index]['src']['tiny'],
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                    ),
                  );
                })),
          )),
          InkWell(
            onTap: () {
              lodemore();
            },
            child: Container(
              child: Center(
                child: Text(
                  'Load More',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.black,
              height: 60,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
