import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screen/create_room_screen.dart';
import 'package:tictactoe/screen/join_room_screen.dart';
import 'package:tictactoe/widget/custom_button.dart';
import 'package:tictactoe/widget/custom_sizedbox.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(onTap: () {
              Get.to(CreateRoomScreen());
            }, text: 'Create Room',),
            gap(20,0),
            CustomButton(onTap: () {
              Get.to(JoinRoomScreen());
            }, text: 'Join Room',),
          ],
        ),
      )
    ));
  }
}
