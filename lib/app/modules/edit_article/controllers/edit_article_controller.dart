import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/article_model.dart';
import '../../../data/service/api_service.dart';

class EditArticleController extends GetxController {
  final Article article = Get.arguments;

  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  final articleYearController = TextEditingController();

  @override
  void onInit() {
    categoryController.text = article.category;
    titleController.text = article.title;
    dateController.text = article.date;
    descriptionController.text = article.description;

    super.onInit();
  }

  void submitForm(BuildContext context) async {
    if (categoryController.text.isEmpty ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        dateController.text.isEmpty) return;

    Article article = Article(
      cover: "",
      category: categoryController.text,
      date: dateController.text,
      id: this.article.id,
      description: descriptionController.text,
      title: titleController.text,
    );

    ArticleService.editArticle(article).then((value) {
      const snackBar = SnackBar(
        content: Text('Success Edit Data'),
        backgroundColor: Colors.teal,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      clearForm();
      Navigator.of(context).pop();
    });
  }

  void clearForm() {
    categoryController.clear();
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }
}
