import 'package:get/get.dart';
import 'package:tictactoe/screen/model/player_model.dart';

class RoomDataProvider extends GetxController {

  Map<String, dynamic> _roomData= {};

  Map<String, dynamic> get roomData => _roomData;

  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );

  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  Player get player1 => _player1;
  Player get player2 => _player2;

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    update(); // Notify listeners using GetX's update method
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    update(); // Notify listeners using GetX's update method
  }

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    update(); // Notify listeners using GetX's update method
  }


}