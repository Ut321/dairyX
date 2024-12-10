import 'package:dairyx/common/Successful_widget.dart';
import 'package:dairyx/common/button_widget.dart';
import 'package:dairyx/controllers/register/register_controller.dart';
import 'package:dairyx/feature/dashBoard/dashboard.dart';
import 'package:dairyx/feature/registerPage/widgets/form_widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: signUpForm(formKey: _formKey, size: size,),
        ),
      ),
    );
  }
}

