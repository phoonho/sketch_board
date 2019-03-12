import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sketch_board/sketch_board.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  File image;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SketchBoard.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
    );
//    var url = await homeModel.uploadImage2Oss(file: croppedFile);
    if (croppedFile != null) {
      image = croppedFile;
      SketchBoard.sketchImage(sourcePath: image.path);
      setState(() {
      });
    }
  }

  Future gallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    await _cropImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sketch board demo'),
        ),
        body: Center(
          child: image != null ? Image.file(image) : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            gallery();
          },
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
