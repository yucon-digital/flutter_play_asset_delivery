import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_play_asset_delivery/flutter_play_asset_delivery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<File> image;

  @override
  void initState() {
    super.initState();

    // get an asset file
    // final videoFile = FlutterPlayAssetDelivery.getAssetFile("video.mp4");
    
    // get an absolute path of a file 
    image = FlutterPlayAssetDelivery.getAssetFile("flutter.png");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FutureBuilder(
            future: image,
            builder: (_, AsyncSnapshot<File> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              return Image.file(snapshot.data!);
            },
          ),
        ),
      ),
    );
  }
}
