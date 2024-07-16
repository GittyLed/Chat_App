import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID; // מזהה המשתמש השולח
  final String senderEmail; // כתובת הדוא"ל של המשתמש השולח
  final String receiverID; // מזהה המשתמש המקבל
  final String message; // תוכן ההודעה
  final Timestamp timestamp; // חותם הזמן של ההודעה
  final bool isRead; // מציין אם ההודעה נקראה או לא

  // בנאי למחלקה
  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
    this.isRead = false, // ברירת מחדל: ההודעה לא נקראה
  });

  // המרת ההודעה למפת נתונים
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID, // מזהה המשתמש השולח
      'senderEmail': senderEmail, // כתובת הדוא"ל של המשתמש השולח
      'receiverID': receiverID, // מזהה המשתמש המקבל
      'message': message, // תוכן ההודעה
      'timestamp': timestamp, // חותם הזמן של ההודעה
      'isRead': isRead, // מציין אם ההודעה נקראה או לא
    };
  }

  // המרת מפת נתונים לאובייקט הודעה
  static Message fromMap(Map<String, dynamic> map) {
    return Message(
      senderID: map['senderID'], // מזהה המשתמש השולח
      senderEmail: map['senderEmail'], // כתובת הדוא"ל של המשתמש השולח
      receiverID: map['receiverID'], // מזהה המשתמש המקבל
      message: map['message'], // תוכן ההודעה
      timestamp: map['timestamp'], // חותם הזמן של ההודעה
      isRead: map['isRead'] ?? false, // מציין אם ההודעה נקראה או לא (ברירת מחדל: לא נקראה)
    );
  }
}