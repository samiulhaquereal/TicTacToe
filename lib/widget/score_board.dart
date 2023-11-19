import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/widget/custom_sizedbox.dart';

class ScoreBoard extends StatelessWidget {

  final RoomDataProvider controller = Get.put(RoomDataProvider());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.player1.nickname,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              gap(10, 0),
              Text(controller.player1.points.toInt().toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.player2.nickname,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              gap(10, 0),
              Text(controller.player2.points.toInt().toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
            ],
          ),
        )
      ],
    );
  }
}
