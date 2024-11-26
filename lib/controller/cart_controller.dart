import 'package:get/get.dart';
import 'package:silvermarket/classes/item_class.dart';

class CartController extends GetxController {
  var cartedItems = <ItemClass, int>{}.obs;

  Map<ItemClass, int> getCartedItems() {
    return cartedItems;
  }

  void deleteItem(ItemClass item) {
    cartedItems.remove(item);
    update();
  }

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
