import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/auth/models/sign_up_model.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/screens/main_screen.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  SignUpModel signUpModel = SignUpModel();
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<void> onPressed(BuildContext context) {
    final Completer<void> completer = Completer<void>();

    apiModel
        .postApi(route: "/register", jsonData: signUpModel.toJson())
        .then((resData) async {
      if (resData["error"] == false) {
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // final Vendor vendor = Vendor.fromJson(resData["data"]);
        // await pref.setString("authToken", vendor.authToken!);
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const Home(),
        // ));
        // pref.getString("authToken");
      } else {
        CustomSnackBar(message: resData["message"]).showSnackBar(context);
      }
      completer.complete();
    });

    return completer.future;
  }

  void setController(
      {required value, required void Function(String) updateModel}) {
    updateModel(value);
  }
}
