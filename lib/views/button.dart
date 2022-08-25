import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final int index;

  const Button({Key? key, required this.index}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  List subsc = [];

  List list = [
    'cricket',
    'football',
    'hockey',
  ];

  bool unsub = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          unsub = !unsub;
        });
        if (unsub == true) {
          print('subscribe');
          await FirebaseMessaging.instance.subscribeToTopic(widget.index == 0
              ? 'cricket'
              : widget.index == 1
                  ? 'football'
                  : 'hockey');
        } else {
          print('Unsubscribe');
          await FirebaseMessaging.instance
              .unsubscribeFromTopic(widget.index == 0
                  ? 'cricket'
                  : widget.index == 1
                      ? 'football'
                      : 'hockey');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
        height: 30,
        width: 100,
        color: unsub == false ? Colors.blue : Colors.grey,
        child: Center(
          child: Text(unsub == true ? 'Unsubscribe' : 'subscribe'),
        ),
      ),
    );
  }
}
