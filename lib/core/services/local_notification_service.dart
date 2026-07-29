import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService._();

  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  //---------------------------------------------------------------------
  static const AndroidNotificationChannel newStudentChannel = 
    AndroidNotificationChannel(
    'new_user_channel', //id
    'New User Notifications',
    description: 'Notifications for when new student registered',
    importance: Importance.high,
  );
  static const AndroidNotificationChannel expenseChannel =
      AndroidNotificationChannel(
        'expense_channel',
        'Expense Updates',
        description: 'Notifications related to expenses',
        importance: Importance.high,
      );
  static const AndroidNotificationChannel budgetChannel =
      AndroidNotificationChannel(
        'budget_channel',
        'Budget Alerts',
        description: 'Alerts when budget is exceeded',
        importance: Importance.max,
      );
  static const AndroidNotificationChannel highImportanceChannel = 
    AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Channel',
      description: 'This chnale use for default notification',
      importance: Importance.high,
    );

  //---------------------------------------------------------------------
  static Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _notifications.initialize(settings);

    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(newStudentChannel);
    await androidPlugin?.createNotificationChannel(expenseChannel);
    await androidPlugin?.createNotificationChannel(budgetChannel);
    await androidPlugin?.createNotificationChannel(highImportanceChannel);
  }

  //---------------------------------------------------------------------
  static Future<void> showNotification({
    required AndroidNotificationChannel channel,
    required String title,
    required String body,
  }) async {
    await _notifications.show(
      0,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  // static Future<void> showNotification({
  //   required String title,
  //   required String body,
  // }) async {
  //   await _notifications.show(
  //     0,
  //     title,
  //     body,
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'high_importance_channel',
  //         'High Importance Notifications',
  //         channelDescription:
  //           'This channel is used for important notifications.',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       )
  //     )
  //   );
  // }
}
