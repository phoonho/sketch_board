import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_board/sketch_board.dart';

void main() {
  const MethodChannel channel = MethodChannel('sketch_board');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SketchBoard.platformVersion, '42');
  });
}
