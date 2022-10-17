import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Payment/payment_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import '../Utils/color_utils.dart';
import '../Utils/custom_flutter_toast.dart';
import '../Utils/fontFamily_utils.dart';
import '../Utils/image_utils.dart';
import '../Views/customeWidgets/custom_appbar.dart';
import '../Views/customeWidgets/custom_btn.dart';
import '../Views/customeWidgets/custom_text_field.dart';
import '../model/user_model.dart';
import 'debit_card_input_formate.dart';

class PaymentScreen extends StatefulWidget {

  String amount;


  PaymentScreen(
      {Key? key, required this.amount})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedoption = '';
  bool saveCard = false;
  int whatIsWrong = 0;
  bool isLoading = false;
  bool isPaymentLoading = false;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expMonthController = TextEditingController();
  final TextEditingController _expYearController = TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();
  final TextEditingController describeOtherIssue = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void setLoaderState(bool state) {
    if (mounted)
      setState(() {
        isLoading = state;
      });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  ///////////////GET DATA//////////////
  SharedPreferences? sharedPreferences;
  String userName = "";


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(title: "Payment",),),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        CustomTextField(
                          fieldController: _cardNumberController,
                          fieldName: "Card Number",
                          inputFormat: [
                            MaskedTextInputFormatter(
                              mask: 'xxxx-xxxx-xxxx-xxxx',
                              separator: '-',
                            ),
                          ],
                          keyboard: TextInputType.number,
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                fieldController: _expMonthController,
                                fieldName: "Exp. Month",
                                maxLength: 2,

                                counterText: "",
                                keyboard: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: CustomTextField(
                                fieldController: _expYearController,
                                fieldName: "Exp. year",
                                maxLength: 4,

                                counterText: "",
                                keyboard: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: CustomTextField(
                                fieldController: _securityCodeController,
                                fieldName: "CVV",
                                keyboard: TextInputType.number,
                                maxLength: 3,

                                counterText: "",
                                obscureText: true,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Center(
                                child: CustomButton(

                                 buttonText: "Pay",


                                  onTap: () {
                                    int currentYear = DateTime.now().year;
                                    if (_cardNumberController.text == "") {
                                      FlutterToast.toast(
                                          "Please enter card number");
                                    } else if (_expMonthController.text == "") {
                                      FlutterToast.toast(
                                          "Please enter Exp.month");
                                    } else if (_expYearController.text == "") {
                                      FlutterToast.toast(
                                          "Please enter Exp.year");
                                    } else if (_securityCodeController.text ==
                                        "") {
                                      print(
                                          "ffg :- ${int.parse(_expMonthController.text)}");
                                      FlutterToast.toast(
                                          "Please enter security code");
                                    } else if (int.parse(
                                            _expMonthController.text) >=
                                        13) {
                                      FlutterToast.toast(
                                          "Please enter valid month");
                                    } else if (int.parse(
                                            _expYearController.text) <
                                        currentYear) {
                                      FlutterToast.toast(
                                          "Please enter valid year");
                                    } else {
print("sucess");
                                      StripeCard card = StripeCard(
                                          number: _cardNumberController.text,
                                          expMonth: int.parse(
                                              _expMonthController.text),
                                          expYear: int.parse(
                                              _expYearController.text),
                                          cvc: _securityCodeController.text);

                                      print(
                                          "stripe amount :--- ${int.parse(widget.amount) * 100}");
                                      print("card :- ${card}");
                                      Provider.of<PaymentProvider>(context,
                                              listen: false)
                                          .makePayment(paymentAmount: widget.amount.toString(),
                                          amount:
                                                  "${int.parse(widget.amount) * 100}",
                                              context: context,
                                              card: card);
                                    }
                                  },
                                ),
                              ),
                        SizedBox(
                          height: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
