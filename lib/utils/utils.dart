List<Map<String, dynamic>> getPositionedPlayers (List<Map<String, dynamic>> players) {

  int rank = 1;
  List<Map<String, dynamic>> _players = List.from(players);

  for(var i = 0; i < _players.length; i++) {
    if (i != 0 && _players[i - 1]["score"] > _players[i]["score"]) {
      rank++;
    }
    _players[i]["rank"] = rank;
  }

  return _players.toList();
}

String numeral (int number) {
  String num = number.toString();
  String numeralWord = "th";

  if (num[num.length - 1] == "1") {
    numeralWord = "st";
  }
  if (num[num.length - 1] == "2") {
    numeralWord = "nd";
  }

  if (num[num.length - 1] == "3") {
    numeralWord = "rd";
  }

  return "${num}${numeralWord}";
}

String capitalize(String word) {
  if (word.contains(" ")) {
    List<String> wordChunks = word.split(" ");
    wordChunks = wordChunks.map((wordChunk) {
      return wordChunk[0].toUpperCase() + wordChunk.substring(1);
    }).toList();

    return wordChunks.join(" ");
  }

  return word[0].toUpperCase() + word.substring(1);
}