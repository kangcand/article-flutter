import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas/app/data/models/article_model.dart';
import 'package:uas/app/data/service/api_service.dart';

class DetailArticleController extends GetxController {
  final Article article = Get.arguments;

  Future<void> handleDelete(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Delete Article'),
          content: const Text('Are you sure?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                ArticleService.deleteArticle(article).then((value) {
                  const snackBar = SnackBar(
                    content: Text('Success Delete'),
                    backgroundColor: Colors.teal,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
