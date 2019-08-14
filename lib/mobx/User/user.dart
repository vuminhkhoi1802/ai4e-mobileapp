import "package:mobx/mobx.dart";
part 'user.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  int id;
  String name;
  int level;
  int score;
  int streak;
  @action
  Future login(data) async {
    id = data.id;
    name = data.name;
    level = data.level;
    score = data.score;
    streak = data.streak;
  }
}
