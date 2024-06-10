import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotifications {
  final _fcm = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    print("message handling !!!");
  }

  final _androidchannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High importance notifications',
    description: 'This channel is used for High notifications',
    importance: Importance.high,
    playSound: true,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  RemoteMessage _parseRemoteMessage(String payload) {
    final Map<String, dynamic> data = jsonDecode(payload);
    return RemoteMessage.fromMap(data);
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      final payload = response.payload;
      if (payload != null) {
        final message = _parseRemoteMessage(payload);
        handleMessage(message);
      }
    });

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidchannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              _androidchannel.id, _androidchannel.name,
              channelDescription: _androidchannel.description,
              icon: '@drawable/ic_launcher'),
        ),
        payload: jsonEncode(message.data),
      );
    });
  }

  Future initNotifications() async {
    await _fcm.requestPermission();
    final fcmToken = await _fcm.getToken();
    print("fcm Token :  $fcmToken");
    await initLocalNotifications();
    initPushNotifications();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}
