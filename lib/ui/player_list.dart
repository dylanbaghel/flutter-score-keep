import 'package:flutter/material.dart';

import './player.dart';

class PlayerList extends StatelessWidget {

  final List<Map<String, dynamic>> players;
  final Function removePlayer;
  final Function incScore;
  final Function decScore;

  PlayerList(this.players, this.removePlayer, this.incScore, this.decScore);

  Widget _buildPlayerList() {
    if (players.length > 0) {
      return new ListView.builder(
        itemCount: players.length,
        itemBuilder: (BuildContext context, int position) {
          return new Player(players[position], removePlayer, incScore, decScore);
        },
      );
    }

    return new Center(
      child: new Text(
        "No Players Added",
        style: new TextStyle(
          fontSize: 21.1,
          fontStyle: FontStyle.italic,
          color: Colors.grey
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {



    return _buildPlayerList();
  }

}