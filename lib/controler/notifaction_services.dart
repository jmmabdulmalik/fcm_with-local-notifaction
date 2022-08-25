// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
//
// class NotificationService {
//   static final NotificationService _notificationService =
//       NotificationService._internal();
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   NotificationService._internal();
//
//   Future<void> initNotification() async {
//     // Android initialization
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     // ios initialization
//     const IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );
//     tz.initializeTimeZones();
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> showNotification(
//       int id, String title, String body, DateTime dt) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//
//       title == 'zonedshedule'
//           ? tz.TZDateTime.from(dt, tz.local).add(const Duration(seconds: 1))
//           : tz.TZDateTime.now(tz.local).add(const Duration(
//               seconds: 1)), //schedule the notification to show after 2 seconds.
//       const NotificationDetails(
//         // Android details
//         android: AndroidNotificationDetails('main_channel', 'Main Channel',
//             channelDescription: "Flutter",
//             importance: Importance.max,
//             priority: Priority.max),
//         // iOS details
//         iOS: IOSNotificationDetails(
//           sound: 'default.wav',
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//         ),
//       ),
//
//       // Type of time interpretation
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle:
//           true, // To show notification even when the app is closed
//     );
//   }
// }
