import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silvermarket/pages/common/appbar.dart';
import 'package:silvermarket/pages/item_regi_page/widget/item_description.dart';

class ItemRegiPage extends StatefulWidget {
  const ItemRegiPage({super.key});

  @override
  State<ItemRegiPage> createState() => _ItemRegiPageState();
}

class _ItemRegiPageState extends State<ItemRegiPage> {
  XFile? _pickedImage; // To store the selected image

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '상품 등록 페이지'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GestureDetector(
            onTap: _pickImage, // Trigger image picker
            child: _pickedImage == null
                ? Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xFF182233),
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.white,
                    ),
                  )
                : Image.file(
                    File(_pickedImage!.path), // Display selected image
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 50),
          ItemDescription(pickedImage: _pickedImage),
        ],
      ),
    );
  }
}
