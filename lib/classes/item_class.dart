import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';

class ItemClass {
  String name;
  String description;
  String category;
  int price;
  XFile? image;

  ItemClass(
      {required this.name,
      required this.description,
      required this.price,
      required this.category,
      this.image});
}
