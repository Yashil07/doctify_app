import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/customeWidgets/custom_btn.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:project/Views/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Provider/loader_provider.dart';
import '../../Provider/user_provider.dart';
import '../../Utils/const_utils.dart';
import '../../customMethod/upload_image.dart';
import '../../model/user_model.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/loader_layout.dart';
import '../customeWidgets/show_toast.dart';
import 'login_screen.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  final String? emailId;
  final String? password;

  const ProfileScreen({Key? key, this.emailId, this.password})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();

  final TextEditingController dateInput = TextEditingController();
  String genderInitialValue = 'Male';

  String birthDate = "";

  @override
  void initState() {

    dateInput.text = ""; //set the initial value of text field
    _emailController.text = widget.emailId!;
    super.initState();
  }
  @override
  void dispose() {
    _nameController.clear();
    _addressController.clear();
    _phnoController.clear();
    _emailController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueGrey,
          child: SafeArea(
            child: Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                  title: "Profile",
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Form(
                    key: formKey,
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
                                      child: imageFile?.path.toString() != null &&
                                          imageFile?.path.toString() != ""
                                          ? Image.file(
                                        imageFile!,
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: 160,
                                      )
                                          : Image.asset(ImageUtils.profileAvtar,
                                          fit: BoxFit.cover),
                                    )),
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
                                                color: ColorUtils.grey.withOpacity(0.5),
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
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: ColorUtils.whiteColor,
                                            )),
                                      ),
                                    ))
                              ],
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          fieldName: "Full Name",
                          hintName: "Full Name",
                          fieldController: _nameController,
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          fieldName: "Email",
                          hintName: "Email",
                          fieldController: _emailController,
                          readonly: true,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text("Gender",
                              style: FontTextStyle.poppinsS12W5labelColor),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),

                        Container(
                          width: double.infinity,
                          height: 12.7.w,
                          padding:
                          EdgeInsets.only(left: 4.w, right: 3.w, bottom: 1.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.lightGreyColor),
                            color: ColorUtils.whiteColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: DropdownButton(
                            iconEnabledColor: ColorUtils.grey,
                            style: TextStyle(color: ColorUtils.grey, fontSize: 16),
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
                                  style: FontTextStyle.poppinsS12W5labelColor,
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
                            padding:
                            EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.lightGreyColor),
                              color: ColorUtils.whiteColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                birthDate != null && birthDate != ""
                                    ? Text("$birthDate",
                                    style: FontTextStyle.poppinsS12W5labelColor)
                                    : Text("Select Your Date Of Birth",
                                    style:
                                    FontTextStyle.poppinsS14W4LightGreyColor),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ColorUtils.grey,
                                ),
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
                          fieldController: _phnoController,
                          keyboard: TextInputType.phone,
                          maxLength: 10,
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }else if(str.length != 10){
                              return '* Phone number must be of 10 digit';
                            }
                          },

                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          fieldName: "Address",
                          hintName: "address",
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }
                          },
                          fieldController: _addressController,
                          maxLines: 3,
                          contentPadding: const EdgeInsets.only(left: 20,top: 20),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomButton(
                          onTap: () async {
                            if(formKey.currentState!.validate()){
                              if(birthDate != null && birthDate != ""){
                                print("if 1");
                                if(imageFile != null && imageFile != ""){
                                  print("if 2");
                                  StorageMethods storageMethods =
                                  new StorageMethods();
                                  var url;
                                  if (imageFile != null) {
                                    print("if 3");
                                    Map<String, String> data =
                                    await storageMethods.uploadImageToServer(
                                        imageFile, 'patient_profile_photo');

                                    url = data['url'];
                                    print("url for image:= ${url}");
                                    signUpData(url);
                                  }else{
                                    print("else 3");
                                    showToast(title: "Image is required", status: false);}


                                }else{ print("else 2");showToast(title: "Image is required", status: false);}
                              }else{ print("else 1");
                              showToast(title: "BirthDate is required", status: false);
                              }
                            }                 // if(formKey.currentState!.validate()){
                           //  if(birthDate != null && birthDate != "" && imageFile != null && imageFile != null){
                           //
                           //
                           //  }else if(birthDate != null && birthDate != "" ){
                           //    showToast(title: "BirthDate is required", status: false);
                           //
                           //  }
                           //
                           // }
                           // else if(imageFile != null && imageFile != "" ){
                           //   showToast(title: "Image is required", status: false);
                           // }
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
        ),
        Provider.of<LoaderProvider>(context, listen: true).loader
            ? LoaderLayoutWidget()
            : SizedBox.shrink(),
      ],
    );
  }


  FirebaseAuth auth = FirebaseAuth.instance;
  Future signUpData(String? url) async {
    final loading = Provider.of<LoaderProvider>(context, listen: false);
    loading.setLoader(value: true);
    try {

      final String email = _emailController.text.trim();
      final String password = widget.password!.trim();
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        UserModel currentModel = UserModel(
          email: widget.emailId,
          password: widget.password,
          phoneNumber: _phnoController.text,
          gender: genderInitialValue.toString(),
          birthdate: birthDate,
          address: _addressController.text,
          uid: user?.uid,
          fullName: _nameController.text,
          profileImg: url,
        );

        Provider.of<UserProvider>(context, listen: false)
            .setUserModel(currentModel);
        loading.setLoader(value: false);
        await FirebaseFirestore.instance
            .collection("patients")
            .doc(user?.uid)
            .set({
          'uid': user?.uid,
          "fullName": _nameController.text,
          "email":widget.emailId,
          "password": widget.password,
          'gender': genderInitialValue,
          'birthdate': birthDate,
          "address":_addressController.text,
          'profileImg': url,
          "phoneNumber":_phnoController.text,

        });
      });
      loading.setLoader(value: false);
      showToast(title: "You have successfully registered !!", status: true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));


    } on FirebaseAuthException catch (e) {
      showToast(title: "${e.message}", status: false);

      loading.setLoader(value: false);
    }
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
  // File? imageFile = File('');
  File? imageFile;
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
                                    top: 3.w,
                                    left: 3.w,
                                    right: 3.w,
                                    bottom: 3.w),
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: ColorUtils.whiteColor,
                                )),
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
                                    top: 3.w,
                                    left: 3.w,
                                    right: 3.w,
                                    bottom: 3.w),
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.photo,
                                  color: ColorUtils.whiteColor,
                                )),
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