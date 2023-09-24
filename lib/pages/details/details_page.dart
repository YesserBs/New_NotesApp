import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/database_controller.dart';

class DetailsPage extends StatelessWidget {
  DatabaseController database = Get.find();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter text here',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: 'Enter text here',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(database.Data.value.length.toString())),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () async {
                                String title = titleController.text;
                                String content = contentController.text;

                                // Create a map with the specified data and a unique ID.
                                Map<String, dynamic> newData = {
                                  'id': database.Data.length,  // Assign a unique ID
                                  'title': title,
                                  'content': content,
                                };
                                database.Data.add(newData);

                                // Save the updated data to the database.
                                await database.save();
                                print(database.Data.value);
                              },
                              child: Text('Save'),
                            ),
                            SizedBox(width: 30,),
                            TextButton(
                              onPressed: () async {
                                await database.emptyTable();
                              },
                              child: Text('Clear'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
