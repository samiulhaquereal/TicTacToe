import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screen/game_screen.dart';
import 'package:provider/provider.dart';

class SocketMethods {

  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname){
    if(nickname.isNotEmpty){
      _socketClient.emit('createRoom',{
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname , String roomId){
    if(nickname.isNotEmpty && roomId.isNotEmpty){
      _socketClient.emit('joinRoom',{
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context){
    _socketClient.on('createRoomSuccess', (room) {
      RoomDataProvider roomController = Get.find<RoomDataProvider>();
      roomController.updateRoomData(room);
      Get.to(GameScreen());
    });
    
  }

  void joinRoomSuccessListener(BuildContext context){
    _socketClient.on('joinRoomSuccess', (room) {
      RoomDataProvider roomController = Get.find<RoomDataProvider>();
      roomController.updateRoomData(room);
      Get.to(GameScreen());
    });

  }

  void errorOccurredSuccessListener(BuildContext context){
    _socketClient.on('errorOccurred', (data) {
      Get.snackbar('Error', data);
    });

  }

  void updateRoomListener(BuildContext context){
    _socketClient.on('updateRoom', (data) {
      RoomDataProvider roomController = Get.find<RoomDataProvider>();
      roomController.updateRoomData(data);
    });

  }

  void updatePlayersListener(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      RoomDataProvider roomController = Get.find<RoomDataProvider>();
      roomController.updatePlayer1(playerData[0]);
      roomController.updatePlayer2(playerData[1]);
    });
  }


}