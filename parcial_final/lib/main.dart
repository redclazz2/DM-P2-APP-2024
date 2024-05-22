import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parcial_final/main_application.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel', 
      channelName: 'Basic Notification', 
      channelDescription: 'Notification Channel for App'
      )
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;

    AwesomeNotifications().createNotification(content: 
    NotificationContent(
      id: 10, 
      channelKey: "basic_channel", 
      title: notification!.title,
      body: notification.body),
    );
  });


  runApp(const MainApp());
}
