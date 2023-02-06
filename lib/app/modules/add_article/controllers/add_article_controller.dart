import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uas/app/data/models/article_model.dart';
import 'package:uas/app/data/service/api_service.dart';

class AddArticleController extends GetxController {
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  final coverController = TextEditingController();
  XFile? image;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    coverController.text =
        image!.path.split("/").last.replaceAll("image_picker", "");
  }

  Future<String> uploadToFirebase() async {
    File imageFile = File(image!.path);
    final reference =
        FirebaseStorage.instance.ref().child("/assets/${imageFile.path}");
    final uploadTask = reference.putFile(imageFile);
    final snapshots = await uploadTask.whenComplete(() => {});
    return await snapshots.ref.getDownloadURL();
  }

  void submitForm(BuildContext context) async {
    if (coverController.text.isEmpty ||
        categoryController.text.isEmpty ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        dateController.text.isEmpty) return;

    Article article = Article(
      cover: await uploadToFirebase(),
      category: categoryController.text,
      date: dateController.text,
      id: 00,
      description: descriptionController.text,
      title: titleController.text,
    );

    ArticleService.addNewArticle(article).then((value) {
      const snackBar = SnackBar(
        content: Text('Success Add a New Article'),
        backgroundColor: Colors.teal,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      clearForm();
      Navigator.of(context).pop();
    });
  }

  void clearForm() {
    coverController.clear();
    categoryController.clear();
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }
}
