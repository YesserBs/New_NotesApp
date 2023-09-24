import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/database_controller.dart';


class DetailsPage extends StatelessWidget {
  DatabaseController database = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(database.Data.value.toString().length.toString())),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () async {
                            database.addSampleData();
                            database.save();
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
            )
        )
    );
  }
}
