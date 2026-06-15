import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;
import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hw/domain/interfaces/i_food_recognizer.dart'
    show IFoodRecognizer;

class Utils {
  static Widget getRecipeImage(String? path, double width, double height) {
    final errorWidget = Image.asset(
      'assets/images/default.png',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );

    if (path == null || path == 'default.png' || path.startsWith('[')) {
      return errorWidget;
    }

    if (path.startsWith('assets/')) {
      return Image.asset(path, width: width, height: height, fit: BoxFit.cover);
    }

    if (path.contains('http') || kIsWeb) {
      return CachedNetworkImage(
          imageUrl: path,
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return errorWidget;
          });
    }

    return Image.file(File(path),
        width: width, height: height, fit: BoxFit.cover);
  }

  static Future<img.Image?> convertPathToImg(String path) async {
    try {
      Uint8List bytes;

      if (path.startsWith('assets/') || path.contains('assets')) {
        final ByteData assetData = await rootBundle.load(path);
        bytes = assetData.buffer.asUint8List();
      } else {
        final file = File(path);
        if (!await file.exists()) {
          return null;
        }
        bytes = await file.readAsBytes();
      }

      final img.Image? decodedImage = img.decodeImage(bytes);
      return decodedImage;
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>> parseIngredients(
      String? path, IFoodRecognizer ai) async {
    if (path == null || path == 'default.png' || path.startsWith('[')) {
      return [];
    }

    final image = await convertPathToImg(path);
    if (image == null) {
      return [];
    }

    final list = await ai.recognize(image);
    return list;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
