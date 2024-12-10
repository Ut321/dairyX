import 'dart:async';
import 'package:dairyx/common/Successful_widget.dart';
import 'package:dairyx/common/button_widget.dart';
import 'package:dairyx/feature/registerPage/sign_up_page.dart';
import 'package:dairyx/feature/verify/verify_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyNumberController extends GetxController {
  RxInt countdown = 10.obs; // Initial countdown value
  RxBool showResendButton = false.obs; // Controls visibility of the resend button
  Timer? timer;
  RxString verifyOtp = "".obs;

  void startTimer() {
    showResendButton.value = false;
    countdown.value = 10;

    timer?.cancel(); // Cancel any existing timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        showResendButton.value = true; // Show the resend button
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel(); // Dispose of the timer when the controller is destroyed
    super.onClose();
  }
}

class VerifyNumber extends StatelessWidget {
  final VerifyNumberController controller = Get.put(VerifyNumberController());

  @override
  Widget build(BuildContext context) {
    controller.startTimer(); // Start the timer when the screen is built

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verify your mobile number",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "We sent a 6-digit code to",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (val){
                controller.verifyOtp.value = val;
              },
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: "",
                hintText: "000000",
                hintStyle: TextStyle(color: Color(0xffbbbcbf)),
              ),
            ),
            const SizedBox(height: 10),
            Obx(() {
              return   controller.showResendButton.value ? TextButton(onPressed: (){
                 controller.startTimer();
              }, child: Text("Resend code",style: TextStyle(color: Color(0xff98b5ff)),)): Text(
               "Resend code in ${controller.countdown.value}s",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff666666)),
              );
            }),
            const Spacer(),
            
             Obx(() {
                return ButtonWidget(
                  onPressed: controller.verifyOtp.value.length <= 6
                      ? () {
                        Get.to(()=>SignUpPage());
                        //  showDialog(context: context, builder: (context){
                        //   return SuccessfulWidget(
                        //     title: "",
                        //   );
                        //  });
                          print("Code sent to ${controller.verifyOtp.value}");
                        }
                      : (){
                        Get.snackbar("Error", "Please Enter MobileNumber");
                      }, // Disable button if number is not 10 digits
                  buttonText: "Verify OTP",
                  buttonColor: controller.verifyOtp.value.length == 6
                      ? const Color(0xff4CAF50)
                      : const Color(0xfff2f2f2),
                  textColor: controller.verifyOtp.value.length == 6
                      ? Colors.white
                      : const Color(0xff919191),
                );
              }),
          ],
        ),
      ),
    );
  }
}
