import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(count.toString()),
              Text(
                arg?.toString() ?? "",
                style: Theme.of(context).textTheme.headline4,
              ),
            ]),
      ),
    );
  }
}
