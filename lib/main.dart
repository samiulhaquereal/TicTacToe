import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/screen/main_menu_screen.dart';
import 'package:tictactoe/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(RoomDataProvider()); // Initialize RoomDataProvider
      }),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      home: MainMenuScreen(),
    );
  }
}
