import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screen/game_screen.dart';

class SocketMethods {

  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname){
    if(nickname.isNotEmpty){
      _socketClient.emit('createRoom',{
        'nickname': nickname,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context){
    
    _socketClient.on('createRoomSuccess', (room) {

      print(room);
      Get.to(GameScreen(),arguments: room);
    });
    
  }

}