import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Payment/stripe_key.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';

import '../Utils/custom_flutter_toast.dart';

class PaymentProvider extends ChangeNotifier {
  Stripe? stripe;

  // String? stripAccountId;
  // String? captureAmount;

  bool isLoading = false;

  // String? stripeId;
  bool get getLoaderStatus => isLoading;

  setLoadingState(bool state) {
    isLoading = state;
    notifyListeners();
  }

  initializeStripe() {
    setLoadingState(true);
    stripe = Stripe(
      Stripekey.publishKey, //Your Publishable Key
    );
  }

  Future<void> makePayment(
      {required BuildContext context,
      required String paymentAmount,
      required StripeCard card,
      required String amount}) async {
    setLoadingState(true);
    print("make payment calling");
    initializeStripe();
    Map<String, dynamic> paymentIntentRes = await createPaymentIntent(
      card: card,
      amount: amount,
      context: context,
      paymentAmount: paymentAmount,
    );

    String clientSecret = paymentIntentRes['client_secret'];
    print(clientSecret);
    String paymentMethodId = paymentIntentRes['payment_method'];
    print(paymentMethodId);
    String status = paymentIntentRes['status'];
    print(status);

    if (status == 'requires_action') if (paymentIntentRes['status'] !=
        'requires_capture') {
      FlutterToast.toast('Canceled Transaction.');
      return;
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent({
    required StripeCard card,
    required String amount,
    required BuildContext context,
    required String paymentAmount,
  }) async {
    Map<String, dynamic>? paymentIntentRes, paymentMethod;
    try {
      print("create payment intent calling");
      try {
        paymentMethod = await stripe!.api.createPaymentMethodFromCard(card);
      } catch (e) {
        print(e.toString());
        FlutterToast.toast('${e.toString()}');
        setLoadingState(false);
      }

      print("paymentMethodId ffff :- ${paymentMethod!["id"].toString()}");
      paymentIntentRes = await postCreatePaymentIntent(
        amount: amount,
        paymentAmount: paymentAmount,
        context: context,
        paymentMethodId: paymentMethod['id'].toString(),
      );

      // stripeId = paymentMethod['id'].toString();
      // print("stripe my id :----- $stripeId");
      // print("respose :- ${paymentIntentRes.toString()}");
    } catch (e) {
      print("ERROR_CreatePaymentIntentAndSubmit: $e");
      setLoadingState(false);
    }
    return paymentIntentRes!;
  }

  Future<Map<String, dynamic>> postCreatePaymentIntent({
    required String paymentMethodId,
    required String amount,
    required String paymentAmount,
    required BuildContext context,
  }) async {
    print("payment intents api call amount hold");
    print("Testkey : -${Stripekey.testKey}");
    print("amount:- ${amount}");
    print("paymentMethodId :- ${paymentMethodId}");

    final uri = Uri.parse("https://api.stripe.com/v1/payment_intents");

    final response = await http.post(uri, headers: {
      'Authorization': 'Bearer ${Stripekey.testKey}',
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Stripe-Account': dj.djStripeId
    }, body: {
      "payment_method_types[]": "card",
      "amount": amount,
      "currency": "INR",
      "confirm": 'true',
      "payment_method": paymentMethodId,
      "capture_method": "manual",
    });

    if (response.statusCode == 200) {
      print("hold success");
      var paymentIntent = jsonDecode(response.body);
      // stripAccountId = paymentIntent["id"].toString();
      // captureAmount = paymentIntent["amount"].toString();
      // print("my stripe account id :- ${stripAccountId}");
      // print("capture amount :- ${stripAccountId}");
      // setLoadingState(false);
      acceptRequestCapturePayment(
          captureAmount: amount,
          context: context,
          stripAccountId: paymentIntent["id"].toString());

      return paymentIntent;
    } else {
      print(response.statusCode);
      print(jsonDecode(response.body));
      return {};
    }
  }

  Future<Map<String, dynamic>?> acceptRequestCapturePayment(
      {required BuildContext context,
      required String stripAccountId,
      // required String payReleasePaymentId,
      required String captureAmount}) async {
    print("hhh capture stripAccountId :- ${stripAccountId}");
    print("hhh capture amount :- ${captureAmount}");
    print("TEST key :- ${Stripekey.testKey}");
    setLoadingState(true);
    final uri = Uri.parse(
        "https://api.stripe.com/v1/payment_intents/${stripAccountId}/capture");

    final response = await http.post(uri, headers: {
      'Authorization': 'Bearer ${Stripekey.testKey}',
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Stripe-Account': stripAccountId.toString(),
    }, body: {
      "amount_to_capture": captureAmount
    });
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      var paymentIntentRes = jsonDecode(response.body);

      if (paymentIntentRes['status'] == 'succeeded') {
        // getPaymentPayReleaseData(payReleasePaymentId: payReleasePaymentId);
        FlutterToast.toast('Your payment has been success');
        //
        // setLoadingState(false);
        return {'status': true, 'request': null};
        print("status");
        return null;
      } else {
        FlutterToast.toast('Something went wrong.');
        setLoadingState(false);
        return {'status': false, 'request': null};
      }
    } else {
      var responseBody = jsonDecode(response.body);
      var error = responseBody['error'];
      FlutterToast.toast('${error['message']}');
      setLoadingState(false);
      // paymentStatusDialog(
      //     context: context, title: "Error".tr, msg: error['message']);
      return {'status': false, 'request': null};

      // if (error['code'] == "payment_intent_unexpected_state") {
      //      paymentStatusDialog(
      //          context: context, title: "Error", msg: error['message']);
      //      return {'status': false, 'request': null};
      //    } else {
      //      paymentStatusDialog(
      //          context: context, title: "Error", msg: "Something went wrong!");
      //      return {'status': false, 'request': null};
      //  }
    }
  }
}
