import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/Provider/user_provider.dart';
import 'package:project/Views/Profile/profile_setting_screen.dart';
import 'package:project/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/loader_provider.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/const_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/loader_layout.dart';
import '../customeWidgets/show_toast.dart';
const List<String> list = <String>['Male', 'Female'];
class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _profileuploadController =
  TextEditingController();
  final TextEditingController dateInput = TextEditingController();
  String genderInitialValue = 'Male';
  String  birthDate = "";

  getData() {
    UserModel? model =
        Provider.of<UserProvider>(context, listen: false).userModel;
    setState(() {
      //postUrl = model!.profileimg;
      _nameController.text = "${model!.fullName}";
      _emailController.text = "${model.email}";
      genderInitialValue = "${model.gender}";
     birthDate = "${model.birthdate}";
      _phonenoController.text = "${model.phoneNumber}";
      _addressController.text = "${model.address}";

    });
  }


  Future updateProfileData(uid) async {
    final loading = Provider.of<LoaderProvider>(context, listen: false);
    loading.setLoader(value: true);
    UserModel? model =
        Provider.of<UserProvider>(context, listen: false).userModel;
    await FirebaseFirestore.instance.collection("patients").doc(uid).update({
      'uid': model?.uid,
      "fullName": _nameController.text,
      "email":_emailController.text,
      "password": model!.password,
      'gender': genderInitialValue,
      'birthdate': birthDate,
      "address":_addressController.text,
      'profileImg': '',
      "phoneNumber":_phonenoController.text,
    });

    UserModel modelUpdate =  UserModel(
      uid: model.uid,
      fullName: _nameController.text,
      email:_emailController.text,
      password: model.password,
      gender: genderInitialValue,
      birthdate: birthDate,
      address:_addressController.text,
      profileImg: '',
      phoneNumber:_phonenoController.text,
    );
    Provider.of<UserProvider>(context, listen: false).setUserModel(modelUpdate);
    showToast(title: "Profile updated Successfully !!", status: true);
    loading.setLoader(value: false);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetting()));
  }



  @override
  void initState() {
    getData();
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueGrey,
          child: SafeArea(
            child: Scaffold(
              // appBar: AppBar(
              //   title: const Text('Profile Page',
              //       style: TextStyle(color: Colors.black54)),
              //   leading: const BackButton(color: Colors.black54),
              //   backgroundColor: ColorUtils.appBgColor,
              //   elevation: 3,
              // ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(title: "Profile Update",),),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(

                                  radius: 75,
                                  child: ClipOval(
                                    child: imageFile?.path.toString() != null
                                        && imageFile?.path.toString() != "" ?
                                    Image.file(
                                      imageFile!, fit: BoxFit.cover, height: 160,
                                      width: 160,) :
                                    Image.asset(
                                        ImageUtils.profileAvtar, fit: BoxFit.cover),
                                  )
                              ),
                              Positioned(
                                  bottom: -4.w,
                                  left: 4.w,
                                  right: 4.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      _openImagePickUpBox();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(0.5.w),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              ColorUtils.grey.withOpacity(0.5),
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                          shape: BoxShape.circle,
                                          color: ColorUtils.whiteColor),
                                      child: Container(
                                          height: 11.w,
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtils.primaryColor),
                                          child: Icon(Icons.camera_alt,
                                            color: ColorUtils.whiteColor,)
                                      ),
                                    ),
                                  ))
                            ],
                          )
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        fieldName: "Full Name",
                        hintName: "Full Name",
                        fieldController: _nameController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

                      CustomTextField(
                        fieldName: "Email",
                        hintName: "Email",
                        fieldController: _emailController,
                        keyboard: TextInputType.emailAddress,
                        readonly: true,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                            "Gender", style: FontTextStyle.poppinsS12W5labelColor),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 12.7.w,
                        padding: EdgeInsets.only(
                            left: 4.w, right: 3.w, bottom: 1.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorUtils.lightGreyColor),
                          color: ColorUtils.whiteColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: DropdownButton(
                          iconEnabledColor: ColorUtils.grey,
                          style: TextStyle(
                              color: ColorUtils.grey, fontSize: 16),
                          dropdownColor: ColorUtils.whiteColor,
                          focusColor: ColorUtils.grey,
                          elevation: 0,
                          underline: SizedBox(),
                          value: genderInitialValue,
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: gender.map((String items) {
                            return DropdownMenuItem(
                              child: Text(
                                '${items}',
                                style: FontTextStyle
                                    .poppinsS12W5labelColor,
                              ),
                              value: items != null ? items : "",
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              genderInitialValue = value!;
                              print(value);
                              // genderValue = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text("Date Of Birth",
                            style: FontTextStyle.poppinsS12W5labelColor),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          _openBirthDatePicker(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 12.7.w,
                          padding: EdgeInsets.only(
                              left: 4.w, right: 4.w, bottom: 1.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorUtils.lightGreyColor),
                            color: ColorUtils.whiteColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              birthDate != null && birthDate != "" ? Text(
                                  "$birthDate", style: FontTextStyle
                                  .poppinsS12W5labelColor) : Text(
                                  "Select Your Date Of Birth", style: FontTextStyle
                                  .poppinsS14W4LightGreyColor)
                              , Icon(Icons.keyboard_arrow_down,
                                color: ColorUtils.grey,),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        fieldName: "Phone Number",
                        hintName: "Enter Your Number",
                        fieldController: _phonenoController,
                        keyboard: TextInputType.number,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        fieldName: "Address",
                        hintName: "address",
                        fieldController: _addressController,
                      ),


                      SizedBox(
                        height: 5.h,
                      ),

                      CustomButton(
                        onTap: () {
                          String? uidData = Provider.of<UserProvider>(
                              context,
                              listen: false)
                              .userModel
                              ?.uid;
                          updateProfileData(uidData);

                        },
                        buttonText: "Confirm",
                        textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Provider.of<LoaderProvider>(context, listen: true).loader
            ? LoaderLayoutWidget()
            : SizedBox.shrink(),
      ],
    );
  }
  /////////////////////////////BIRTH DATE//////////////////////

  Future<void> _openBirthDatePicker(BuildContext context) async {
    final _initialDate = DateTime.now();
    final _newDate = await showDatePicker(
        context: context,
        initialDate: _initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (_newDate != null) {
      setState(() {
        birthDate = "${_newDate.month}-${_newDate.day}-${_newDate.year}";

      });
    }
  }

  ////////////////////////////PROFILE IMAGE///////////////////////
  File? imageFile = File('');
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });

      print('Image From Camera: ${imageFile!.path}');
    }
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      print('Image From Gallery: ${imageFile!.path}');
    }
  }

  _openImagePickUpBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: ColorUtils.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.w)),
            child: Container(
              height: 40.w,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _getFromCamera();
                        },
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 3.w, left: 3.w, right: 3.w, bottom: 3.w),
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.camera_alt,color: ColorUtils.whiteColor,)
                            ),
                            Text(
                              'Camera',
                              style: FontTextStyle.poppinsS12W5labelColor,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _getFromGallery();
                        },
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 3.w, left: 3.w, right: 3.w, bottom: 3.w),
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.photo,color: ColorUtils.whiteColor,)
                            ),
                            SizedBox(
                              height: 1.w,
                            ),
                            Text(
                              'Gallery',
                              style: FontTextStyle.poppinsS12W5labelColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}
