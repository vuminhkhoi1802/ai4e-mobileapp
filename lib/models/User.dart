class User {
  final int id;
  final String name;
  final int level;
  final int score;
  final int streak;

  User({this.id, this.level, this.name, this.score, this.streak});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["_id"],
        name: json["name"],
        level: json["level"],
        score: json["score"],
        streak: json["streak"]);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
        'score': score,
        'streak': streak,
      };
}
