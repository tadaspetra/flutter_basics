import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Database {
  final Firestore _firestore = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  Future<void> createNotification({Timestamp whenToNotify}) async {
    bool retVal;
    String fcmToken = await _fcm.getToken();
    try {
      await _firestore.collection("notifications").document(fcmToken).setData({
        'token': fcmToken,
        'whenToNotify': whenToNotify,
        'notificationSent': false,
      });
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
