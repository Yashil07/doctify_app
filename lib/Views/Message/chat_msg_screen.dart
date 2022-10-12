import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:image_picker/image_picker.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:sizer/sizer.dart';

import '../../Service/chat_service.dart';
import '../../Service/function.dart';
import '../../customMethod/upload_image.dart';
import '../../model/chat_model.dart';
import '../../model/user_model.dart';

class ChatMsgScreen extends StatefulWidget {
  final String senderId, receiverId;

  const ChatMsgScreen({
    Key? key,
    required this.senderId,
    required this.receiverId,
  }) : super(key: key);

  @override
  _ChatMsgScreenState createState() => _ChatMsgScreenState();
}

class _ChatMsgScreenState extends State<ChatMsgScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? image;
  String? userImageUrl;

  late String chatId;

  @override
  void initState() {
    // TODO: implement initState

    chatId = chatServiceController.chatId(
      id1: widget.senderId,
      id2: widget.receiverId,
    );
    chatServiceController.setOnlineStatus(
      id: widget.senderId,
      isOnline: true,
    );

    ///update status
    chatServiceController.updateReadStatus(
      id: chatId,
      uid: widget.senderId,
    );

    if (mounted) {}
    super.initState();

    // _scrollController.addListener(() {
    //   if (_scrollController.position.maxScrollExtent ==
    //       _scrollController.position.pixels) {}
    // });

    getCustomerByuid();
  }

  getCustomerByuid() async {
    // DocumentSnapshot userData =
    // await BidService.getUserByuid(widget.receiverId);
    // if (userData['profile_image_url'] != null ||
    //     userData['profile_image_url'] != '') {
    //   userImageUrl = userData['profile_image_url'];
    // } else {
      userImageUrl =
      'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745';
    // }
    // setState(() {});
  }

  ScrollController _scrollController = ScrollController();

  void _scrollDown() {
    final bottomOffset = _scrollController.position.maxScrollExtent;
    _scrollController.jumpTo(bottomOffset);

    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // _scrollController.animateTo(
    //   _scrollController.position.maxScrollExtent,
    //   duration: Duration(seconds: 1),
    //   curve: Curves.fastOutSlowIn,
    // );
  }

  @override
  void dispose() {
    chatServiceController.setOnlineStatus(
      id: widget.senderId,
      isOnline: false,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFF0F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios)
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users_customer')
                    .doc(widget.receiverId)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && snapshot.data != '') {
                    // DocumentSnapshot data = snapshot.data;
                    // Map<String, dynamic> objData =
                    // data.data() as Map<String, dynamic>;
                    //
                    // UserModel model = UserModel.fromJson(objData);
                    //
                    // userImageUrl = model.profileImg;

                    // print(model.toJson());
                    return Column(
                      children: [

                        Text("Hina"),

                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Text(
                          "....",

                        ),
                        Text(
                          "Offline",

                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            // Image.asset(icon_threeDot, scale: 4),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: chatServiceController.chatStream(id: chatId),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot data = snapshot.data;
                    for (int i = 0; i < data.docs.length; i++) {}
                    List<ChatModel> chatList = data.docs.map((e) {
                      return ChatModel.fromJson(e);
                    }).toList();

                    debugPrint(
                        " data.size :: ${data.size}--- chatList ${chatList.length}");


                    // return ListView.builder(
                    //     itemCount: chatList.length,
                    //     itemBuilder: (context, index) {
                    //       // return Text(chatList[index].message!);
                    //       if (chatList[index].senderId == widget.senderId) {
                    //         return rightSideShow(chatList[index]);
                    //       } else {
                    //         return leftSideShow(chatList[index]);
                    //       }
                    //     });
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollDown();
                    });

                    return GroupedListView<ChatModel, DateTime>(
                        shrinkWrap: false,
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                          vertical: 50.h,
                        ),
                        // controller: controller,
                        useStickyGroupSeparators: true,
                        stickyHeaderBackgroundColor: const Color(0xffEFF0F3),
                        separator: const SizedBox(height: 6),
                        elements: chatList,
                        reverse: false,

                        // groupSeparatorBuilder: (value) =>
                        //     const SizedBox(height: 10),
                        groupBy: (value) => DateTime(
                          Functions.getYear(value.createdAt.toString()),
                          Functions.getMonth(value.createdAt.toString()),
                          Functions.getDay(value.createdAt.toString()),
                        ),
                        groupHeaderBuilder: (ChatModel model) => groupHeader(
                          Functions.getFormattedDate(
                            model.createdAt.toString(),
                          ),
                        ),
                        itemComparator: (a, b) => Functions.getFullDate(
                            a.createdAt.toString())
                            .compareTo(
                            Functions.getFullDate(b.createdAt.toString())),
                        itemBuilder: (context, model) {
                          print("hello print :- ${model.message}");
                          if (model.senderId == widget.senderId) {
                            return rightSideShow(model);
                          } else {
                            return leftSideByNilesh(model);
                            // return leftSideShow(model);
                          }
                        });
                  } else {
                    chatServiceController.setLoadingTrue();
                    return Container();
                  }
                },
              ),
            ),

            ///text field
            Container(
              color: ColorUtils.aliceBlue,
            //  height: 220.h,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.go,
                      controller: _messageController,
                     //  style: defaultAppTextStyle(
                     //    fontSize: 40.sp,
                     //    color: Colors.white.withOpacity(0.7),
                     // ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write your message here...",
                        // hintText: "Write your message here...",
                        // hintStyle: defaultAppTextStyle(
                        //   fontSize: 40.sp,
                        //   color: Colors.white.withOpacity(0.7),
                        // ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await pickImage();
                    },
                    child: Icon(Icons.image,size: 30,)
                  ),
                  // SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      //todo send message here
                      if (_messageController.text.isNotEmpty) {
                        ChatModel model = ChatModel();

                        model.senderId = widget.senderId;
                        model.receiverId = widget.receiverId;
                        model.isSeenSender = true;
                        model.message = _messageController.text;
                        model.createdAt =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        chatServiceController.send(
                          model: model,
                          id: chatServiceController.chatId(
                            id1: widget.senderId,
                            id2: widget.receiverId,
                          ),
                        );
                        _messageController.clear();
                        _scrollDown();
                      }
                    },
                    child:Icon(Icons.send)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget skelton({
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

//todo {image here} 1) pick and 2) send to server 3) send in chat url
  pickImage() {

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        // height: 200,
        width: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                final XFile? pickedFile =
                await _picker.pickImage(source: ImageSource.camera);
                StorageMethods()
                    .uploadImageToChatServer(pickedFile)
                    .then((value) async {
                  ChatModel model = ChatModel();

                  model.senderId = widget.senderId;
                  model.receiverId = widget.receiverId;
                  model.isSeenSender = true;
                  model.message = "";
                  model.isImage = true;
                  model.imageUrl = value;
                  model.createdAt =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  await chatServiceController.send(
                    model: model,
                    id: chatServiceController.chatId(
                      id1: widget.senderId,
                      id2: widget.receiverId,
                    ),
                  );
                });
                Get.back();
              },
              child: Icon(
                Icons.camera_alt,
                size: 40.sp,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final XFile? pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
                StorageMethods()
                    .uploadImageToChatServer(pickedFile)
                    .then((value) async {
                  ChatModel model = ChatModel();

                  model.senderId = widget.senderId;
                  model.receiverId = widget.receiverId;
                  model.isSeenSender = true;
                  model.message = "";
                  model.isImage = true;
                  model.imageUrl = value;
                  model.createdAt =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  await chatServiceController.send(
                    model: model,
                    id: chatServiceController.chatId(
                      id1: widget.senderId,
                      id2: widget.receiverId,
                    ),
                  );
                });
                Get.back();
              },
              child: Icon(
                Icons.filter,

              ),
            ),
          ],
        ),
      ),
    );
    // Get.back();
  }

  Widget groupHeader(String text) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 350.w),
      decoration: BoxDecoration(
        color: const Color(0xff00C6BD).withOpacity(0.1),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xff00C6BD),
        ),
      ),
      child: Center(
        child: Text(text,),
      ),
    );
  }

  Widget rightSideShow(ChatModel model) {
    return Align(
      alignment: Alignment.centerRight,
      child:
      model.isImage!
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          appChatImage(imageUrl: model.imageUrl!),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text( Functions.getTime(model.createdAt!),),

              SizedBox(width: 10.w),
              Icon(Icons.remove_red_eye)

            ],
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color:  Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 50.w,
              ),
              child: Center(
                child: Text(
                  model.message.toString(),
                  // color: Colors.white,
                  // maxLines: 10,
                  // fontWeight: FontWeight.w500,
                  style:TextStyle(fontSize: 40.sp,)
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Functions.getTime(model.createdAt!),
                // color: const Color(0xff012239).withOpacity(0.5),
                // fontSize: 40.sp,
              ),
              SizedBox(width: 10.w),
              Icon(Icons.remove_red_eye)
            ],
          ),
        ],
      ),
    );
  }

  Widget leftSideByNilesh(ChatModel model) {
    return Container(
      child: model.isImage!
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: ColorUtils.primaryColor,
            backgroundImage: userImageUrl == null
                ? const NetworkImage(
                'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745')
                : NetworkImage(userImageUrl!),
          ),
          const SizedBox(
            height: 10,
          ),
          appChatImage(imageUrl: model.imageUrl!),
          SizedBox(height: 10.h),
          Text(
            Functions.getTime(model.createdAt!),
            // color: const Color(0xff012239).withOpacity(0.5),
            // fontSize: 40.sp,
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: ColorUtils.primaryColor,
                  backgroundImage: NetworkImage(userImageUrl!),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Text(
                    model.message.toString(),style: TextStyle(color: Colors.black),
                    // color: const Color(0xff012239),
                    // fontWeight: FontWeight.w500,
                    // fontSize: 40.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            Functions.getTime(model.createdAt!),
            // color: const Color(0xff012239).withOpacity(0.5),
            // fontSize: 40.sp,
          ),
        ],
      ),
    );
  }

  Widget leftSideShow(ChatModel model) {
    return Align(
      alignment: Alignment.centerLeft,
      child: model.isImage!
          ? appChatImage(imageUrl: model.imageUrl!)
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 560.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 514.w,
                  height: 172.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      model.message.toString(),
                      // color: const Color(0xff012239),
                      // fontWeight: FontWeight.w500,
                      // fontSize: 40.sp,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: ColorUtils.primaryColor,
                        backgroundImage: userImageUrl == null
                            ? const NetworkImage(
                            'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745')
                            : NetworkImage(userImageUrl!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            Functions.getTime(model.createdAt!),
            // color: const Color(0xff012239).withOpacity(0.5),
            // fontSize: 40.sp,
          ),
        ],
      ),
    );
  }

  Widget appChatImage({
    required imageUrl,
    double width = 200.0,
    double height = 200.0,
    BoxFit? fit = BoxFit.fill,
    BorderRadiusGeometry? borderRadius,
  }) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
      const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      imageUrl: imageUrl,
      width: width,
      height: height,
    );
  }
}
