import "package:mobx/mobx.dart";
import "package:ai4e_mobileapp/utils/CustomSP.dart";
import "package:ai4e_mobileapp/models/User.dart" as UModel;
import "dart:convert";
part 'user.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  int id;
  String name;
  int level;
  int score;
  int streak;
  @action
  login(data) {
    id = data.id;
    name = data.name;
    level = data.level;
    score = data.score;
    streak = data.streak;
  }

  increaseScore(int pointI) {
    score += pointI;
    streak += 1;
    var userInfo = UModel.User(
        id: id, name: name, level: level, score: score, streak: streak);

    CustomSP.saveString("user", json.encode(userInfo.toJson()));
  }
}
