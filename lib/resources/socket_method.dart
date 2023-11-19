import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/game_method.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screen/create_room_screen.dart';
import 'package:tictactoe/screen/game_screen.dart';
import 'package:tictactoe/widget/game_dialog_box.dart';

class SocketMethods {

  final _socketClient = SocketClient.instance.socket!;
  Socket get socketClient => _socketClient;

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

  void tapGrid(int index ,String roomId, List<String> displayElement){
    if(displayElement[index] == ''){
      _socketClient.emit('tap', {
        'index': index,
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

  void tappedListener(BuildContext context) {
    _socketClient.on('tapped', (data) {
      RoomDataProvider roomController = Get.find<RoomDataProvider>();
      roomController.updateDisplayElements(data['index'],data['choice']);
      roomController.updateRoomData(data['room']);
      GameMethods().checkWinner(context, _socketClient);
    });
  }
  
  void pointIncreaseListener(BuildContext context){

    _socketClient.on('pointIncrease', (playerData) {
      RoomDataProvider roomController = Get.find<RoomDataProvider>();
      if(playerData['socketID'] == roomController.player1.socketID){
        roomController.updatePlayer1(playerData);
      }else{
        roomController.updatePlayer2(playerData);
      }
    });
    
  }

  void endGameListener(BuildContext context) {
    _socketClient.on('endGame', (playerData) {
      showGameDialog(context, '${playerData['nickname']} won the game!');
      Get.offAll(CreateRoomScreen());
    });
  }


}