import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Views/customeWidgets/custom_btn.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import 'login_screen.dart';
import 'package:intl/intl.dart';

const List<String> list = <String>['Male','Female'];
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _nameController = TextEditingController();
  final TextEditingController  _genderController = TextEditingController();
  final TextEditingController  _dobController = TextEditingController();
  final TextEditingController  _addressController = TextEditingController();
  final TextEditingController  _profileuploadController = TextEditingController();
  final TextEditingController dateInput = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
  ];
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile Page',style: TextStyle(color:Colors.black54)),
            leading: const BackButton(color: Colors.black54),
            backgroundColor: ColorUtils.appBgColor,
            elevation: 3,

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        CustomTextField(
                          fieldName: "Upload Image",
                          hintName: "Upload Image",
                          fieldController:_profileuploadController,
                        ),

                        SizedBox(height: 2.h,),
                        CustomTextField(
                          fieldName: "Full Name",
                          hintName: "Full Name",
                          fieldController:_nameController,
                        ),
                        SizedBox(height: 2.h,),

                        CustomTextField(
                          fieldName: "Email",
                          hintName: "Email",
                          fieldController:_emailController,
                        ),
                        SizedBox(height: 2.h,),
                        // DropdownButton(
                        //
                        //   // Initial Value
                        //   value: dropdownvalue,
                        //
                        //   // Down Arrow Icon
                        //   icon: const Icon(Icons.keyboard_arrow_down),
                        //
                        //   // Array list of items
                        //   items: items.map((String items) {
                        //     return DropdownMenuItem(
                        //       value: items,
                        //       child: Text(items),
                        //     );
                        //   }).toList(),
                        //   // After selecting the desired option,it will
                        //   // change button value to selected value
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       dropdownvalue = newValue!;
                        //     });
                        //   },
                        // ),
                        // SizedBox(height: 2.h,),
                        // // CustomTextField(
                        // //   fieldName: "Date of birth",
                        // //   hintName: "Date of birth",
                        // //   fieldController:_dobController,
                        // // ),
                        CustomTextField(
                          fieldName: "Address",
                          hintName: "address",
                          fieldController:_addressController,
                        ),
                        SizedBox(height: 3.h,),
                      TextField(
                        controller: dateInput,
                        //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today), //icon of text field
                            labelText: "Date of Birth" //label text of field
                        ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                      ),
                        SizedBox(height: 5.h,),

                        CustomButton(onTap: (){},buttonText:"Confirm",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),

                      ],

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
