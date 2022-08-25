import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../controler/firebase_notifaction_repo.dart';
import '../main.dart';
import 'button.dart';

class NotifactionScreen extends StatefulWidget {
  const NotifactionScreen({super.key});

  @override
  _NotifactionScreenState createState() => _NotifactionScreenState();
}

class _NotifactionScreenState extends State<NotifactionScreen> {
  int _counter = 0;
  String token = '';

  List list = [
    'cricket',
    'football',
    'hockey',
  ];

  bool index = true;

  late FirebaseMessaging messaging;

  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      setState(() {
        token = value!;
        print(token);
      });
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('message receive');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing $_counter",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifactions'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(flex: 3, child: Text(list[index])),
                      Expanded(
                        child: Button(
                          index: index,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          InkWell(
            onTap: () {
              NotifactionRepo.postNotifaction(token: token);
            },
            child: Container(
              height: 40,
              width: 150,
              color: Colors.red,
              child: const Center(child: Text('notification by device')),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              NotifactionRepo.postNotifaction(token: 'topic/cricket');
            },
            child: Container(
              height: 40,
              width: 150,
              color: Colors.green,
              child: const Center(child: Text('notification by topic')),
            ),
          ),
        ],
      ),
    );
  }
}
