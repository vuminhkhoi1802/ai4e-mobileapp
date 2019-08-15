double _squeeze(double low, high, value) {
  if (value < low) {
    return 0;
  }
  if (value > high) {
    return 10;
  }
  return (value - low) / (high - low) * 10;
}

double calculateScore (Map<String, dynamic> data, String topic, int duration) {
  Map<dynamic, dynamic> sentiment = data["sentiment"];
  final double magnitude = _squeeze(0.4, 3, sentiment["magnitude"].abs());
  final double score = _squeeze(0.4, 0.9, sentiment["score"].abs());
  double total = (magnitude * score + (topic == data["topic"] ? 300 : 50)) / 4;
  if (duration < 120) {
    total *= 0.75;
  }
  return total;
}