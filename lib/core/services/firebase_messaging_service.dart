import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc_lab/core/services/local_notification_service.dart';
import 'package:flutter_bloc_lab/core/services/notification_type.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// handle notificaon when app is background
@pragma('vm:entry-point')
Future<void> firebaseMessgingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //-------------------------------------------------------------
  Future<void> initialize() async {
    await _requestPermission();
    await _getFCMToken();

    // flutter inbuild method call for handle background notofication
    FirebaseMessaging.onBackgroundMessage(firebaseMessgingBackgroundHandler);

    onForegroundNotification();
    onNotificationClick();
    onTerminatedNotification();
  }

  //-------------------------------------------------------------
  Future<void> _requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  //-------------------------------------------------------------
  Future<void> _getFCMToken() async {
    final token = await _messaging.getToken();
    if (token != null) {
      print("FCM Token : $token");
      await _saveTokenToFirestore(token);
    }
  }

  Future<void> _saveTokenToFirestore(String token) async {
    await _firestore.collection('deviceTokens').doc(token).set({
      'token': token,
      'createdAt': FieldValue.serverTimestamp(),
    });
    print("Token saved successfully");
  }

  //-------------------------------------------------------------
  // Foreground Notification Method
  void onForegroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  
      final channel = _getChannel(message.data["type"]);

      LocalNotificationService.showNotification(
        channel: channel, 
        title: message.notification?.title ?? "", 
        body: message.notification?.body ?? "",
      );
    });
  }

  // Tereminted Notificaion Method
  Future<void> onTerminatedNotification() async {
    RemoteMessage? message = await FirebaseMessaging.instance
        .getInitialMessage();
    if (message != null) {}
  }

  void onNotificationClick() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  // helper method for foreground method for swithc statment
  AndroidNotificationChannel _getChannel(String? type) {
    switch (type) {
      case NotificationType.studentCreated:
        return LocalNotificationService.newStudentChannel;
        
      case NotificationType.expense:
        return LocalNotificationService.expenseChannel;

      case NotificationType.budgetExceeded:
      return LocalNotificationService.budgetChannel;

      default:
      return LocalNotificationService.highImportanceChannel;
    }
  }
}
