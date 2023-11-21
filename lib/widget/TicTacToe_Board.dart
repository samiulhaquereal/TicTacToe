import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socket_method.dart';

class TicTacToeBoard extends StatefulWidget {
  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final RoomDataProvider controller = Get.put(RoomDataProvider());

  final SocketMethods _socketMethods = SocketMethods();

  void tapped(int index,RoomDataProvider controller){
    _socketMethods.tapGrid(index, controller.roomData['_id'], controller.displayElement);
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.7,
        maxWidth: 500
      ),
      child: AbsorbPointer(
        absorbing: controller.roomData['turn']['socketID'] != _socketMethods.socketClient.id,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  tapped(index,controller);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white24
                  )
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    child: Text(controller.displayElement[index],style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 40,
                            color: controller.displayElement[index] == 'O' ? Colors.blue : Colors.redAccent
                          )
                        ]),),
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
