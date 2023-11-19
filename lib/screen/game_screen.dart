import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socket_method.dart';
import 'package:tictactoe/screen/waiting_lobby_screen.dart';
import 'package:tictactoe/widget/score_board.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final RoomDataProvider controller = Get.put(RoomDataProvider());
    return SafeArea(child: Scaffold(
      body: controller.roomData['isJoin'] ? WaitingLobby()
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ScoreBoard()
        ],
      )
    ));
  }
}
