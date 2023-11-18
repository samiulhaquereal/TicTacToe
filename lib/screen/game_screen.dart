import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Text("${Get.arguments}".toString()),
      ),
    ));
  }
}
