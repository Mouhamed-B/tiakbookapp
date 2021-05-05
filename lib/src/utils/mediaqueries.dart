import 'package:flutter/material.dart' show BuildContext, MediaQuery;

double vw(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.width * ratio;
}

double vh(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.height * ratio;
}
