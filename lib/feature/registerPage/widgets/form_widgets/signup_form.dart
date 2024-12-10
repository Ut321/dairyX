import 'package:dairyx/common/Successful_widget.dart';
import 'package:dairyx/common/button_widget.dart';
import 'package:dairyx/controllers/register/register_controller.dart';
import 'package:dairyx/feature/dashBoard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpForm extends StatelessWidget {
  const signUpForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.size,
  
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Size size;
 

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          const Center(
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "John",
                        hintStyle: TextStyle(color: Color(0xffbbbcbf)),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          controller.firstName.value = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First Name is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last Name",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Doe',
                        hintStyle: TextStyle(color: Color(0xffbbbcbf)),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          controller.lastName.value = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last Name is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "E-Mail Name",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Your email',
              hintStyle: TextStyle(color: Color(0xffbbbcbf)),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => controller.email.value = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!GetUtils.isEmail(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Text(
            "Password",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Obx(
            () => TextFormField(
              obscuringCharacter: "*",
              decoration: InputDecoration(
                hintText: '******',
                hintStyle: TextStyle(color: Color(0xffbbbcbf)),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
              obscureText: !controller.isPasswordVisible.value,
              onChanged: (value) => controller.password.value = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 8) {
                  return 'Password must contain at least 8 characters';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'must contain 8 char.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Confirm Password",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Obx(
            () => TextFormField(
              obscuringCharacter: "*",
              decoration: InputDecoration(
                hintText: '*****',
                hintStyle: TextStyle(color: Color(0xffbbbcbf)),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isConfirmPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.toggleConfirmPasswordVisibility,
                ),
              ),
              obscureText: !controller.isConfirmPasswordVisible.value,
              onChanged: (value) =>
                  controller.confirmPassword.value = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                } else if (value != controller.password.value) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 32),
          ButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Handle account creation
                showDialog(
                    context: context,
                    builder: (context) {
                      return SuccessfulWidget(
                          title: "Account Created Success!",
                          onNavigate: () {
                            Get.off(() => DashboardPage());
                          });
                    });
              }
            },
            buttonText: "Create Account",
            textColor: Colors.white,
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text.rich(
              TextSpan(
                text: 'By continuing, you agree to our ',
                style:  TextStyle(fontSize: 12, color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
