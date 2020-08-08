void main() async {
  var res = await task2();
  print(res);
}

Future task2() async {
  Duration delay = Duration(seconds: 3);
  String data;
  await Future.delayed(delay, () {
    data = "Password: 123@456";
  });
  return data;
}
