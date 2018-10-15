import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import './../utils/utils.dart';

class Player extends StatelessWidget {
  final Map<String, dynamic> player;
  final Function removePlayer;
  final Function incScore;
  final Function decScore;

  Player(this.player, this.removePlayer, this.incScore, this.decScore);

  @override
  Widget build(BuildContext context) {
    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.20,
      key: new Key(player["id"]),
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'Remove',
          icon: Icons.remove,
          color: Colors.red,
          onTap: () {
            removePlayer(player["id"]);
          },
        )
      ],
      child: new Card(
        shape: new RoundedRectangleBorder(
          side: new BorderSide(
            color: getRankColor(player["rank"]),
            width: 3.0,
          ),
        ),
        elevation: 5.0,
        child: new ListTile(
          title: new Text(
            capitalize(player["name"]),
            style: new TextStyle(
              fontSize: 21.1,
              fontWeight: FontWeight.bold,
              color: getRankColor(player["rank"]),
            ),
          ),
          subtitle: new Text(
            "${numeral(player["rank"])} Place ${player["score"]} Point(s).",
            style: new TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic
            ),
          ),
          trailing: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new IconButton(
                color: Colors.black,
                icon: Icon(Icons.add),
                onPressed: () {
                  incScore(player["id"]);
                },
              ),
              new IconButton(
                color: Colors.black,
                icon: new Icon(Icons.remove),
                onPressed: () {
                  decScore(player["id"]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getRankColor(int rank) {
  if (rank == 1) {
    return Colors.green;
  } else if (rank == 2) {
    return Colors.blue;
  } else if (rank == 3) {
    return Colors.red;
  }

  return Colors.black;
}
