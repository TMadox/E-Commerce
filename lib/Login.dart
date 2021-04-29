import 'package:e_commerce/Widgets/Switchbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'AdminPage.dart';
import 'Logic/FireBaseOperations.dart';
import 'Logic/ValueStates.dart';
import "UserPage.dart";
import 'Widgets/Applogo.dart';
import 'Widgets/MainButtons.dart';
import 'Widgets/ColorsNConstants.dart';
import 'Signup.dart';
import 'package:get/get.dart';
import 'Widgets/TextFields.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final height = Get.height;
  final width = Get.width;

  final GlobalKey<NavigatorState> navkey = new GlobalKey<NavigatorState>();
  final States statecontroller = Get.put(States());
  GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  var _email;
  var _password;
  Authentication logic = new Authentication();
  final auth = FirebaseAuth.instance;
  final loggedinuser = GetStorage("Loggedin");
  @override
  Widget build(BuildContext context) {
    return GetBuilder<States>(
      builder: (controller) => Scaffold(
        backgroundColor: violet,
        body: ModalProgressHUD(
          color: violet,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ember),
          ),
          inAsyncCall: controller.loadingstate,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppLogo(),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Form(
                    key: _gkey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        CustomTextField(
                          icon: Icons.mail,
                          hinttext: "Enter your Email",
                          onsubmit: (value) {
                            _email = value;
                          },
                          color: violet,
                        ),
                        CustomTextField(
                          icon: Icons.vpn_key,
                          hinttext: "Enter your Password",
                          onsubmit: (value) {
                            _password = value;
                          },
                          color: violet,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    FirstButtons(
                      label: "Register",
                      onpressed: () {
                        Get.to(() => SignupScreen());
                      },
                      color: ember,
                      icon: Icons.person,
                    ),
                    FirstButtons(
                      label: "Login",
                      onpressed: () async {
                        validation();
                      },
                      color: ember,
                      icon: Icons.person,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: controller.alwayssigned,
                        onChanged: (value) {
                          controller.changealwayssignedstate();
                        },
                        activeColor: ember,
                        focusColor: ember,
                        checkColor: violet,
                        fillColor: MaterialStateProperty.all(ember),
                      ),
                      Text(
                        "Stay signed in.",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                SwitchButton(
                  mode: controller.adminuser ? "Admin" : "User",
                  switchbool: controller.adminuser,
                  onswitch: (value) {
                    controller.changeusertype();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validation() async {
    if (_gkey.currentState.validate()) {
      _gkey.currentState.save();
      try {
        statecontroller.changeloadingstate();
        await logic.login(_email, _password);
        statecontroller.changeloadingstate();
        if (statecontroller.adminuser) {
          if (auth.currentUser.displayName == "ADMIN") {
            Get.offAll(() => AdminPage());
          } else {
            Get.snackbar("Error", "User is not an admin.");
          }
        } else {
          setalwayslogged();
          Get.offAll(() => UserPage());
        }
      } catch (e) {
        Get.snackbar("Error", e.message);
        statecontroller.changeloadingstate();
      }
    }
  }

  void setalwayslogged() {
    if (statecontroller.alwayssigned) {
      loggedinuser.write("Email", _email);
      loggedinuser.write("Password", _password);
    } else {
      loggedinuser.erase();
    }
  }
}
