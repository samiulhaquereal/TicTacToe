import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/resources/socket_method.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screen/controller/create_room_controller.dart';
import 'package:tictactoe/widget/custom_button.dart';
import 'package:tictactoe/widget/custom_sizedbox.dart';
import 'package:tictactoe/widget/custom_text.dart';
import 'package:tictactoe/widget/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  TextEditingController name = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue
                    )
              ],
                  text: 'Create Room',
                  fontSize: 70),
              gap(Get.height * 0.08, 0),
              CustomTextField(
                controller: name,
                hintText: 'Enter Game-Name',),
              gap(Get.height * 0.045, 0),
              CustomButton(onTap: (){
                _socketMethods.createRoom(name.text);
              }, text: 'Create')
            ],
          ),
        ),
      ),
    ));
  }
}
