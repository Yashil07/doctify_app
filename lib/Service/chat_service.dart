import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/chat_model.dart';


class ChatServiceController extends GetxController {
  ///loader
  RxBool loading = false.obs;

  setLoadingTrue() => loading.value = true;

  setLoadingFalse() => loading.value = false;

  ///collection

  final CollectionReference chatCollection =
  FirebaseFirestore.instance.collection("chat");
  final CollectionReference patientsCollection = FirebaseFirestore.instance
      .collection("patients");
  final CollectionReference doctorCollection = FirebaseFirestore.instance
      .collection("doctor");

  ///chat id create
  String chatId({
    required String id1,
    required String id2,
  }) {
    debugPrint('id1 length => ${id1.length} id2 length=> ${id2.length}');
    if (id1.compareTo(id2) > 0) {
      return id1 + '-' + id2;
    } else {
      return id2 + '-' + id1;
    }
  }

  send({
    required id,
    required ChatModel model,
  }) {
    // chatCollection.doc(id).set({
    //   "senderId": model.senderId,
    //   "receiverId": model.receiverId,
    // });

    chatCollection
        .doc(id)
        .collection("messages")
        .doc()
        .set(model.toJson());
  }

  ///update read status
  updateReadStatus({
    required String id,
    required String uid,
  }) {
    chatCollection
        .doc(id)
        .collection("messages")
        .where('receiverId', isEqualTo: uid)
        .where('isSeenReceiver', isEqualTo: false)
        .get()
        .then((value) {
      for (int i = 0; i < value.size; i++) {
        chatCollection
            .doc(id)
            .collection("messages")
            .doc(value.docs[i].id)
            .update({"isSeenReceiver": true});
      }
    });
  }

  ///chat stream
  Stream<QuerySnapshot<Map<String, dynamic>>> chatStream({
    required String id,
  }) {
    return chatCollection
        .doc(id)
        .collection("messages")
        .orderBy('createdAt', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot<Object?>> getChat({
    required String uid,
  }) {
    return chatCollection.where('receiverId', isEqualTo: uid).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUnReadChatCountStream({
    required String id,
    required String uid,
  }) {
    return chatCollection
        .doc(id)
        .collection("messages")
        .where('receiverId', isEqualTo: uid)
        .where('isSeenReceiver', isEqualTo: false)
        .snapshots();
  }

  ///online status
  setLastMessage({
    required String id,
    required String lastMessage,
  }) {
    patientsCollection.doc(id).update({
      'last_message': lastMessage,
    });
  }

  setOnlineStatus({
    required String id,
    required bool isOnline,
  }) {
    doctorCollection.doc(id).update({
      'online': isOnline,
    });
  }
}

final ChatServiceController chatServiceController =
Get.put(ChatServiceController());
