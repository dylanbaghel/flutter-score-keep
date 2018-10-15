import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './player_list.dart';
import './add_player.dart';
import './../utils/utils.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _App();
  }
}

class _App extends State<App> {
  List<Map<String, dynamic>> _players = [];

  void handleAddPlayer(String playerName) {
    Map<String, dynamic> _player = {
      "id": new Uuid().v1(),
      "name": playerName,
      "score": 0
    };

    setState(() {
      _players.add(_player);
    });
  }

  void removePlayer(String id) {
    setState(() {
      _players.removeWhere((player) => player["id"] == id);      
    });
  }

  void incScore(String id) {
    setState(() {
      _players = _players.map((player) {
        if (player["id"] != id) {
          return player;
        }

        player["score"]++;
        return player;
      }).toList();      
    });
  }
  void decScore(String id) {
    setState(() {
      _players = _players.map((player) {
        if (player["id"] != id) {
          return player;
        }

        player["score"]--;
        return player;
      }).toList();      
    });
  }

  @override
  Widget build(BuildContext context) {
    _players.sort((a, b) {
      if (a["score"] == b["score"]) {
        return 0;
      }
      if (a["score"] > b["score"]) {
        return -1;
      }
      if (a["score"] < b["score"]) {
        return 1;
      }
    });

    _players = getPositionedPlayers(_players);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Score Keep"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return new AddPlayer(handleAddPlayer);
                  });
            },
          )
        ],
      ),
      body: new Container(
        color: Color(0xFFCCCCCC),
        padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        child: new PlayerList(_players, removePlayer, incScore, decScore),
      ),
    );
  }
}
