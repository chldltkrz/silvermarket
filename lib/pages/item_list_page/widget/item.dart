import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:silvermarket/classes/item_class.dart';

class Item extends StatelessWidget {
  final ItemClass item;

  Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: item.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(item.image!.path), // Convert XFile to File
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: Icon(Icons.error, color: Colors.white),
                        );
                      },
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 40,
                    ),
                  ), // Default placeholder if image is null
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text("선택"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      item.description,
                      style: TextStyle(fontSize: 13),
                    ),
                    Spacer(),
                    Text(
                      NumberFormat('#,###').format(item.price) + '원',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
