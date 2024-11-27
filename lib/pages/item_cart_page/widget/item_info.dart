import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silvermarket/classes/item_class.dart';

class ItemInfo extends StatelessWidget {
  final ItemClass item;
  final int quantity;
  final void Function() onRemove;
  final void Function() onAdd;
  final void Function() onDelete;

  ItemInfo({
    super.key,
    required this.item,
    required this.quantity,
    required this.onRemove,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Item Image or Placeholder
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Light grey background for placeholder
            borderRadius: BorderRadius.circular(10),
          ),
          child: item.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(item.image!.path), // Load the image from file
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  Icons.image, // Placeholder icon
                  color: Colors.grey[600],
                  size: 40,
                ),
        ),
        // Item Details
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                NumberFormat('#,###').format((item.price * quantity)) + '원',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Spacer(),
        // Quantity Controls
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(10), // Rounded corners
            border: Border.all(color: Colors.grey[300]!), // Light grey border
          ),
          child: Row(
            children: [
              IconButton(
                onPressed:
                    quantity > 0 ? onRemove : null, // Disable if quantity is 0
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: quantity > 0
                      ? Colors.black
                      : Colors.grey, // Greyed out if disabled
                ),
              ),
              Text(
                '$quantity', // Display the current quantity
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onAdd, // Call onAdd to increase quantity
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        // Remove Item Button
        GestureDetector(
          onTap: () {
            onDelete(); // Call onDelete to remove the item
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              CupertinoIcons.trash,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
