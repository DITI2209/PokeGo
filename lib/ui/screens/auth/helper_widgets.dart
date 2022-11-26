import "package:flutter/material.dart";

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget buildLoadingUi() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildFailureUi(String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          "Fail $message",
          style: TextStyle(color: Colors.red),
        ),
      ),
      buildInitialUi(),
    ],
  );
}

Widget buildInitialUi() {
  return Container(
    padding: EdgeInsets.all(5.0),
    child: Text(
      "Enter Login Credentials",
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.teal,
      ),
    ),
  );
}
