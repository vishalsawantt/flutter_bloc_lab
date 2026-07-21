import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


@pragma('vm:entry-point')
Future<void> firebaseMessgingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("========== BACKGROUND ==========");

  print("Title : ${message.notification?.title}");
  print("Body  : ${message.notification?.body}");
  print("Data  : ${message.data}");

  print("================================");
}

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initialize() async {
    await _requestPermission();
    await _getFCMToken();

    FirebaseMessaging.onBackgroundMessage(firebaseMessgingBackgroundHandler);

    onForegroundNotification();
    onNotificationClick();
    onTerminatedNotification();
  }

  Future<void> _requestPermission() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> _getFCMToken() async {
    final token = await _messaging.getToken();
    if (token != null) {
      print("FCM Token : $token");
      await _saveTokenToFirestore(token);
    }
  }

  // Future<void> _saveTokenToFirestore(String token) async {
  //   await _firestore.collection('deviceTokens').add({
  //     'token' : token,
  //     'createdAt' : FieldValue.serverTimestamp(),
  //   });
  //   print("Token saved successfully");
  // }

  Future<void> _saveTokenToFirestore(String token) async {
    await _firestore.collection('deviceTokens').doc(token).set({
      'token' : token,
      'createdAt' : FieldValue.serverTimestamp(),
    });
    print("Token saved successfully");
  }

  void onForegroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("========== FOREGROUND ==========");

    print("Title : ${message.notification?.title}");
    print("Body  : ${message.notification?.body}");
    print("Data  : ${message.data}");

    print("================================");
    });
  }
  
  void onNotificationClick() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("========== CLICK FROM BACKGROUND ==========");

    print("Title : ${message.notification?.title}");
    print("Body  : ${message.notification?.body}");

    print("===========================================");
    });
  }

  Future<void> onTerminatedNotification() async {
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      print("========== APP OPENED FROM TERMINATED ==========");

    print("Title : ${message.notification?.title}");
    print("Body  : ${message.notification?.body}");

    print("================================================");
    }
  }
}