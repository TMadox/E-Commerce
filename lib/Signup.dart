import 'package:flutter/material.dart';
import 'Logic/ValueStates.dart';
import 'Widgets/Applogo.dart';
import 'Widgets/ColorsNConstants.dart';
import 'Widgets/MainButtons.dart';
import 'Logic/FireBaseOperations.dart';
import 'Widgets/TextFields.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  final height = Get.height;
  final width = Get.width;
  var _email;
  var _password;
  var _passwordr;
  Authentication logic = new Authentication();
  final States statecontroller = Get.put(States());
  GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet,
      body: GetBuilder<States>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: controller.loadingstate,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  AppLogo(),
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
                          CustomTextField(
                            icon: Icons.vpn_key,
                            hinttext: "Re-Enter your Password",
                            onsubmit: (value) {
                              _passwordr = value;
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
                      FirstButtons(
                        label: "Signup",
                        onpressed: () async {
                          if (_gkey.currentState.validate()) {
                            _gkey.currentState.save();
                            if (_password != _passwordr) {
                              Get.defaultDialog(
                                  title: "Error!",
                                  middleText: "Passwords do not match");
                            } else {
                              try {
                                statecontroller.changeloadingstate();
                                await logic.signup(_email, _password);
                                statecontroller.changeloadingstate();
                                Get.snackbar(
                                    "Success", "Account created successfully!");
                              } catch (e) {
                                Get.snackbar("Error", e.message);
                                statecontroller.changeloadingstate();
                              }
                            }
                          }
                        },
                        color: ember,
                        icon: Icons.person,
                      ),
                      FirstButtons(
                        label: "Login",
                        onpressed: () {
                          Get.back();
                        },
                        color: ember,
                        icon: Icons.person,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
