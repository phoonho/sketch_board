import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SketchBoard {
  static const MethodChannel _channel = const MethodChannel('sketch_board');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<File> sketchImage({
    @required String sourcePath,
  }) async {
    assert(sourcePath != null);
    final String resultPath =
        await _channel.invokeMethod('SketchBoard', <String, dynamic>{
      'source_path': sourcePath,
    });
    return resultPath == null ? null : File(resultPath);
  }
}
