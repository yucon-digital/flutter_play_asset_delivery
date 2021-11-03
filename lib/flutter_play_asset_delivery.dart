
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterPlayAssetDelivery {
  static const String _methodGetAsset = "getAssetFile";
  static const MethodChannel _channel = MethodChannel('flutter_play_asset_delivery');

  static Future<File> getAssetFile(String asset) async {
    try {
      final path = await getAbsoluteFilePath(asset);
      final file = File(path);
      return file;
    } catch (_) {
      throw Exception("Asset file $asset not found.");
    }
  }

  static Future<String> getAbsoluteFilePath(String asset) async {
    return (await _channel.invokeMethod(_methodGetAsset, asset)) as String;
  }
}
