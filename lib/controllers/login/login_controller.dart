import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  RxBool isTextFieldFocused = false.obs;
  FocusNode textFieldFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  RxString phoneNumber = ''.obs;

  void toggleFocus(bool focused) {
    isTextFieldFocused.value = focused;

    if (focused) {
      textFieldFocusNode.requestFocus();
    } else {
      textFieldFocusNode.unfocus();
    }
  }

  @override
  void onClose() {
    textFieldFocusNode.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
