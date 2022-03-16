import 'package:flutter/material.dart';
import 'package:gophr/ui/components/app_colours.dart';
import 'constants.dart';

Widget showError(AsyncSnapshot snapshot) {
  return Column(
    children: [
      const Center(
          child: Icon(
        Icons.error,
        color: Colors.red,
        size: kErrorIconSize,
      )),
      Text(snapshot.error.toString()),
    ],
  );
}

Widget progressIndicator() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      CircularProgressIndicator(
        color: AppColors.black,
      ),
      SizedBox(
        height: 20.0,
      ),
      Text("Loading at the moment, please wait...")
    ],
  ));
}
