import 'package:country_code_picker/country_code_picker.dart';
import 'package:dairyx/common/app_title_widget.dart';
import 'package:dairyx/common/button_widget.dart';
import 'package:dairyx/controllers/login/login_controller.dart';
import 'package:dairyx/feature/registerPage/verify_number/verify_number.dart';
import 'package:dairyx/utils/app_Texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Obx(() {
          return Visibility(
            visible: controller.isTextFieldFocused.value,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                controller.toggleFocus(false);
              },
            ),
          );
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () => Column(

            children: [
              if (!controller.isTextFieldFocused.value) ...[
                const SizedBox(height: 70,),
                const AppTitleWidget(),
                const SizedBox(height: 10),
                Text(
                  Apptexts.welcomeBack,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  Apptexts.appSubTitile,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 50),
              ],
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Apptexts.enterYourNumber,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      Apptexts.verifyYourNumber,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                children: [
                  const CountryCodePicker(
                    showFlag: false,
                    initialSelection: "+91",
                    showDropDownButton: true,
                    textStyle: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Expanded(
                    child: TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      focusNode: controller.textFieldFocusNode,
                      controller: controller.phoneController,
                      onChanged: (value) {
                        controller.phoneNumber.value = value;
                      },
                      onTap: () {
                        controller.toggleFocus(true);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                            counterText: "",

                        hintText: "Phone number",
                        hintStyle: TextStyle(color: Color(0xffbbbcbf)),
                      ),
                    ),
                  ),
                ],
              ),
              // Show the number of digits entered
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "${controller.phoneNumber.value.length}",
                  style: TextStyle(
                    color: Color(0xffcccccc),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              if (!controller.isTextFieldFocused.value) ...[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color(0xffc1d5f6)),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/google.svg",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Sign In With Google",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              Obx(() {
                return ButtonWidget(
                  onPressed: controller.phoneNumber.value.length <= 10
                      ? () {
                          Get.to(()=> VerifyNumber());
                          print("Code sent to ${controller.phoneNumber.value}");
                        }
                      : (){
                        Get.snackbar("Error", "Please Enter MobileNumber");
                      }, // Disable button if number is not 10 digits
                  buttonText: "Send Code",
                  buttonColor: controller.phoneNumber.value.length == 10
                      ? const Color(0xff4CAF50)
                      : const Color(0xfff2f2f2),
                  textColor: controller.phoneNumber.value.length == 10
                      ? Colors.white
                      : const Color(0xff919191),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}