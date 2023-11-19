import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/widget/custom_sizedbox.dart';
import 'package:tictactoe/widget/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {

  final RoomDataProvider controller = Get.put(RoomDataProvider());
  late TextEditingController roomIdController;


  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
        text: controller.roomData['_id']
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Waiting for a player to join...'),
        gap(20, 0),
        CustomTextField(controller: roomIdController, hintText: '',isReadyOnly: true),
      ],
    );
  }
}
