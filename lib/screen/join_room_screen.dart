import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/resources/socket_method.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screen/controller/join_room_controller.dart';
import 'package:tictactoe/widget/custom_button.dart';
import 'package:tictactoe/widget/custom_sizedbox.dart';
import 'package:tictactoe/widget/custom_text.dart';
import 'package:tictactoe/widget/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen ({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {

  //final JoinRoomController controller = Get.put(JoinRoomController());
  final SocketMethods _socketMethods = SocketMethods();
  TextEditingController name = TextEditingController();
  TextEditingController roomid = TextEditingController();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurredSuccessListener(context);
    _socketMethods.updatePlayersListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    roomid.dispose();
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
                      text: 'Join Room',
                      fontSize: 70),
                  gap(Get.height * 0.08, 0),
                  CustomTextField(
                    controller: name,
                    hintText: 'Enter Game-Name',),
                  gap(Get.height * 0.045, 0),
                  CustomTextField(
                    controller: roomid,
                    hintText: 'Enter Room Code',),
                  gap(Get.height * 0.045, 0),
                  CustomButton(onTap: (){
                    _socketMethods.joinRoom(name.text, roomid.text);
                  }, text: 'Join')
                ],
              ),
            ),
          ),
        ));
  }
}
