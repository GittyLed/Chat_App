class Users {
  String uid; // מזהה המשתמש
  String email; // כתובת הדוא"ל של המשתמש
  bool hasUnreadMessages; // מציין אם יש למשתמש הודעות לא נקראות

  // בנאי למחלקה
  Users({
    required this.uid,
    required this.email,
    this.hasUnreadMessages = false, // ברירת מחדל: אין הודעות לא נקראות
  });

  // המרת המשתמש למפת נתונים
  Map<String, dynamic> toMap() {
    return {
      'uid': uid, // מזהה המשתמש
      'email': email, // כתובת הדוא"ל של המשתמש
      'hasUnreadMessages': hasUnreadMessages, // מציין אם יש למשתמש הודעות לא נקראות
    };
  }

  // המרת מפת נתונים לאובייקט משתמש
  static Users fromMap(Map<String, dynamic> map) {
    return Users(
      uid: map['uid'], // מזהה המשתמש
      email: map['email'], // כתובת הדוא"ל של המשתמש
      hasUnreadMessages: map['hasUnreadMessages'] ?? false, // מציין אם יש למשתמש הודעות לא נקראות (ברירת מחדל: אין הודעות לא נקראות)
    );
  }
}