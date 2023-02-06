import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../helpers/size_helper.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/edit_article_controller.dart';

class EditArticleView extends GetView<EditArticleController> {
  const EditArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Article'),
        centerTitle: true,
      ),
      body: Container(
        height: displayHeight(context) * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controller.titleController,
                title: 'Title',
                readOnly: false,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controller.categoryController,
                title: 'Category',
                readOnly: false,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.dateController,
                cursorColor: Colors.teal,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Tanggal",
                  labelText: "Tanggal",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'input book date!';
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2024));
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    controller.dateController.text = formattedDate;
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                readOnly: false,
                decoration: InputDecoration(
                  label: Text(
                    "Description",
                    style: const TextStyle(color: Colors.teal),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: controller.descriptionController,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => controller.submitForm(context),
                child: const Text('EDIT'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
