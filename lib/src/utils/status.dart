class Status {
  bool state = false;
  String message = "";
  var e;

  Status({required this.state, required this.message, this.e});

  Status.Success({required this.state, required this.message});

  Status.Error({required this.state, required this.message, required this.e});
}
