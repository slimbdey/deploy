import 'package:image/image.dart' show Image;

abstract class IFoodRecognizer {
  Future<List<String>> recognize(Image image);
}
