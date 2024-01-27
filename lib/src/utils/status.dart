class Status {
  bool state = false;
  String message = "";
  Exception? e;

  Status({required this.state, required this.message, this.e});

  Status.success({required this.state, required this.message});

  Status.error({required this.state, required this.message, required this.e});
}
