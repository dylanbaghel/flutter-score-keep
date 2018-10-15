import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
    final Function addPlayer;
    AddPlayer(this.addPlayer);
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final TextEditingController _addPlayerController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: new Container(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            new TextField(
              controller: _addPlayerController,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                labelText: "Player Name",
                hintText: "Enter Player Name...."
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          color: Colors.red,
          child: new Text(
            "Add Player",
            style: new TextStyle(
              color: Colors.white
            ),
          ),
          onPressed: () {
            if (_addPlayerController != null && _addPlayerController.text.trim() != "") {
              String playerName = _addPlayerController.text.trim();
              widget.addPlayer(playerName);
              _addPlayerController.clear();
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
