import 'package:demo_dashboard/screen_configs.dart';
import 'package:demo_dashboard/snackbar.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';
import 'dashboard.dart';
import 'database_functions.dart';
import 'database_handler.dart';
import 'helper_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    await Storage.initialize();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    _displayTextField(TextEditingController controller, String hintText,
        {bool isObscure = false}) {
      return SizedBox(
        width: ScreenConfig.screenSizeWidth * 0.7,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: ScreenConfig.screenSizeWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                heightGap(0.6),
                SizedBox(
                    height: ScreenConfig.screenSizeHeight * 0.05,
                    width: ScreenConfig.screenSizeWidth * 0.3,
                    child: Icon(
                      Icons.shop_2_sharp,
                      color: Colors.black,
                      size: ScreenConfig.screenSizeWidth * 0.3,
                    )),
                heightGap(0.3),
                _displayTextField(emailController, "Email"),
                _displayTextField(passwordController, "Password",
                    isObscure: true)
              ],
            ),
          ),
        ),
        floatingActionButton: mediumButton("Register / Login", () {
          if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            loginRegister(emailController.text, passwordController.text, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            }, context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                showSnackbar("Please don't leave any field empty"));
          }
        }, 0.93),
      ),
    );
  }
}
