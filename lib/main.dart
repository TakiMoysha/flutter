import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttr_hi/cities_list.dart';

const flrSplashLogo = "res/flare/loading-error-and-check.flr";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hi',
      home: Container(
        color: Colors.blue,
        child: Builder(
          builder: (context) {
            return FlareActor(
              flrSplashLogo,
              animation: "success",
              callback: (name) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CitiesListWidget(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
