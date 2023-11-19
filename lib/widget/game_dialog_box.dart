import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/resources/game_method.dart';

void showGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                GameMethods().clearBoard(context);
                Get.back();
              },
              child: const Text(
                'Play Again',
              ),
            ),
          ],
        );
      });
}