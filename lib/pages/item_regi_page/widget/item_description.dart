import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silvermarket/classes/item_class.dart';
import 'package:silvermarket/controller/item_controller.dart';

class ItemDescription extends StatefulWidget {
  final XFile? pickedImage;
  ItemDescription({this.pickedImage, super.key});

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  final ItemController controller = Get.put(ItemController());
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text('상품 이름',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text('상품 가격',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('상품 설명',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                try {
                  if (widget.pickedImage == null) {
                    throw Exception('No image selected');
                  }

                  final newItem = ItemClass(
                    image: widget.pickedImage!,
                    name: nameController.text,
                    description: descriptionController.text,
                    price: int.parse(priceController.text),
                    category: "category",
                  );

                  controller.putItem(newItem);
                  Get.snackbar(
                    'Success',
                    'Item registered successfully!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } catch (e) {
                  print(e);
                  Get.snackbar(
                    'Error',
                    'Please enter valid inputs.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                '등록하기',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
