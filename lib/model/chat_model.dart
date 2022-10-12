import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? senderId, receiverId, message, createdAt, imageUrl;
  bool? isSeenSender, isSeenReceiver, isImage;

  ChatModel({
    this.senderId,
    this.receiverId,
    this.message,
    this.createdAt,
    this.isSeenReceiver = false,
    this.isSeenSender = false,
    this.isImage = false,
    this.imageUrl,
  });

  ///from json
  ChatModel.fromJson(DocumentSnapshot<Object?> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    message = json['message'];
    createdAt = json['createdAt'];
    isSeenReceiver = json['isSeenReceiver'];
    isSeenSender = json['isSeenSender'];
    isImage = json["isImage"];
    imageUrl = json['imageUrl'];
  }

  ///to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["senderId"] = senderId;
    _data["receiverId"] = receiverId;
    _data['message'] = message;
    _data["createdAt"] = createdAt;
    _data["isSeenReceiver"] = isSeenReceiver;
    _data["isSeenSender"] = isSeenSender;
    _data['isImage'] = isImage;
    _data['imageUrl'] = imageUrl;
    return _data;
  }
}
