import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../details/details_page.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController HC = Get.find();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: _SearchFormField(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(DetailsPage(), arguments: [index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3), // Shadow color
                                      spreadRadius: 1, // Spread radius
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 2), // Offset
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 13),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Text(
                                          "BanjourBanjourBanjou",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[900],
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Text(
                                          "BanjourBanjourBanjourBanjourBanjourBanjourBanjourBanjour",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Get.to(DetailsPage(), arguments: [null, null, -1]);
                },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Shadow color
                      spreadRadius: 1, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(0, 0), // Offset
                    ),
                  ],
                ),
                child: Icon(
                  CupertinoIcons.plus,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget _SearchFormField() {
  //DatabaseController dbController = Get.find();
  return Container(
    height: 36.0,
    margin: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(9),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Shadow color
          spreadRadius: 1, // Spread radius
          blurRadius: 10, // Blur radius
          offset: Offset(0, 0), // Offset
        ),
      ],
    ),
    child: TextFormField(
      onChanged: print,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      ),
      style: TextStyle(color: Colors.grey),
    ),
  );
}