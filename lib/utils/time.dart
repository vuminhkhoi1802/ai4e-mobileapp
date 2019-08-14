String parseSecondToMinute(int second) {
  var minute = second ~/ 60;
  second = second % 60;
  if (second.toString().length == 1) {
    return "$minute:0$second";
  }
  return "$minute:$second";
}
