import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/widget/game_dialog_box.dart';

class GameMethods{

  void checkWinner(BuildContext context, Socket socketClient){

    final RoomDataProvider roomDataProvider = Get.put(RoomDataProvider());

    String winner = '';

    // Checking rows
    if (roomDataProvider.displayElement[0] ==
        roomDataProvider.displayElement[1] &&
        roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[2] &&
        roomDataProvider.displayElement[0] != '') {
      winner = roomDataProvider.displayElement[0];
    }
    if (roomDataProvider.displayElement[3] ==
        roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[3] ==
            roomDataProvider.displayElement[5] &&
        roomDataProvider.displayElement[3] != '') {
      winner = roomDataProvider.displayElement[3];
    }
    if (roomDataProvider.displayElement[6] ==
        roomDataProvider.displayElement[7] &&
        roomDataProvider.displayElement[6] ==
            roomDataProvider.displayElement[8] &&
        roomDataProvider.displayElement[6] != '') {
      winner = roomDataProvider.displayElement[6];
    }

    // Checking Column
    if (roomDataProvider.displayElement[0] ==
        roomDataProvider.displayElement[3] &&
        roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[6] &&
        roomDataProvider.displayElement[0] != '') {
      winner = roomDataProvider.displayElement[0];
    }
    if (roomDataProvider.displayElement[1] ==
        roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[1] ==
            roomDataProvider.displayElement[7] &&
        roomDataProvider.displayElement[1] != '') {
      winner = roomDataProvider.displayElement[1];
    }
    if (roomDataProvider.displayElement[2] ==
        roomDataProvider.displayElement[5] &&
        roomDataProvider.displayElement[2] ==
            roomDataProvider.displayElement[8] &&
        roomDataProvider.displayElement[2] != '') {
      winner = roomDataProvider.displayElement[2];
    }

    // Checking Diagonal
    if (roomDataProvider.displayElement[0] ==
        roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[8] &&
        roomDataProvider.displayElement[0] != '') {
      winner = roomDataProvider.displayElement[0];
    }
    if (roomDataProvider.displayElement[2] ==
        roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[2] ==
            roomDataProvider.displayElement[6] &&
        roomDataProvider.displayElement[2] != '') {
      winner = roomDataProvider.displayElement[2];
    } else if (roomDataProvider.filledBoxes == 9) {
      winner = '';
      showGameDialog(context, 'Draw');
    }

    if (winner != '') {
      if (roomDataProvider.player1.playerType == winner) {
        showGameDialog(context, '${roomDataProvider.player1.nickname} won!');
        socketClient.emit('winner', {
          'winnerSocketId': roomDataProvider.player1.socketID,
          'roomId': roomDataProvider.roomData['_id'],
        });
      } else {
        showGameDialog(context, '${roomDataProvider.player2.nickname} won!');
        socketClient.emit('winner', {
          'winnerSocketId': roomDataProvider.player2.socketID,
          'roomId': roomDataProvider.roomData['_id'],
        });
      }
    }
  }

  void clearBoard(BuildContext context) {
    final RoomDataProvider roomDataProvider = Get.put(RoomDataProvider());

    for (int i = 0; i < roomDataProvider.displayElement.length; i++) {
      roomDataProvider.updateDisplayElements(i, '');
    }
    roomDataProvider.setFilledBoxesTo0();
  }
}