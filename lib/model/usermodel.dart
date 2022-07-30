import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? uid;
  String? name;
  Timestamp? createdAt;
  int? age;

  UserData({this.uid, this.name, this.createdAt, this.age});

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['createdAt'] ?? Timestamp.now();
    age = json['age'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['age'] = this.age;
    return data;
  }
}
