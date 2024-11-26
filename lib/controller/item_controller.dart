import 'package:get/get.dart';
import 'package:silvermarket/classes/item_class.dart';

class ItemController extends GetxController {
  final List<ItemClass> items = [];

  ItemClass? getItem(String name) {
    try {
      final itemReturn = items.firstWhere(
        (element) => element.name == name,
      );
      return itemReturn;
    } catch (e) {
      return null;
    }
  }

  List<ItemClass> getItems() {
    return items;
  }

  bool putItem(ItemClass item) {
    final testItem = getItem(item.name);
    if (getItem(item.name) != null) {
      return false;
    }
    items.add(item);
    update();
    return true;
  }
}
