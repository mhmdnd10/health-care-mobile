import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/Textfield.dart';
import 'package:healthcareapp/components/elevatedButton.dart';
import 'package:healthcareapp/controllers/loginController.dart';
import 'package:healthcareapp/routes/appRoute.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            ClipRect(
              child: Image.asset(
                'assets/background.jpg',
                width: double.infinity,
                height: Get.height * 0.7,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: Get.height * 0.2,
              left: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's get you signed in!",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Enter your info below",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Get.height * 0.4,
              bottom: 0,
              left: 40,
              right: 40,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/google.png',
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Sign in with google!",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Text('OR'),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Textfield(
                        obsqureText: false,
                        hintText: "enter your email",
                        label: 'Email',
                        controller: controller.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textfield(
                        obsqureText: true,
                        hintText: "enter your password",
                        label: 'Password',
                        controller: controller.password,
                        inputType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.forgotPassword);
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Elevatedbutton(
                        onPressed: () {
                          Get.offAllNamed(AppRoute.home);
                        },
                        backColor: Colors.brown,
                        foreColor: Colors.white,
                        text: 'Sign in',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Don't have an account?"),
                          SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.register);
                            },
                            child: Text(
                              'Sign up!',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
