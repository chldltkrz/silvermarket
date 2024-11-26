import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:silvermarket/classes/item_class.dart';

class CartController extends GetxController {
  final Map<ItemClass, int> cartedItems = {};

  void addItem(ItemClass item) {
    if (cartedItems.containsKey(item)) {
      cartedItems[item] = cartedItems[item]! + 1;
    } else {
      cartedItems[item] = 1;
    }
    update();
  }

  void removeItem(ItemClass item) {
    if (cartedItems.containsKey(item)) {
      if (cartedItems[item]! > 1) {
        cartedItems[item] = cartedItems[item]! - 1;
      } else {
        cartedItems.remove(item);
      }
      update();
    }
  }

  void clearCart() {
    cartedItems.clear();
    update();
  }
}
