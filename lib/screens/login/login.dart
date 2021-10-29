import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_project/providers/login_provider.dart';
import 'package:sample_project/screens/example/listpage.dart';
import 'package:sample_project/screens/login/login_controller.dart';
import 'package:sample_project/services/storage_service.dart';
import 'package:sample_project/themes/app_colors.dart';
import 'package:sample_project/widgets/buttons.dart';

class MyLogIn extends GetView<LoginController> {
  MyLogIn({Key? key}) : super(key: key);

  final focusNode = FocusNode();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final loginProvider = LoginProvider(client: Client());
  LoginController item = Get.find();

  var autoMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolors.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: 500,
            height: 900,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("lib/assets/images/B_logo.png"),
                          radius: 35,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'Welcome to Bubble',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Enthusiasm just creates bubbles; it doesn t keep them from popping',
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    //fit: StackFit.loose,

                    children: <Widget>[
                      loginCurveContainer(
                          Appcolors.shadowColor, LoginLightPinkCurve()),
                      loginCurveContainer(
                          Appcolors.appPink, LoginDarkPinkCurve()),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: Obx(() {
                        if (item.isLoading.value == false) {
                          Fluttertoast.showToast(
                              msg: item.errorMessage.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER);
                          return Center(
                              child: Text(item.errorMessage.toString()));
                        } else {
                          return Form(
                            key: _formKey,
                            autovalidateMode: autoMode,
                            child: Column(
                              children: [
                                MyTextFormFieldWidget(
                                  controller: nameController,
                                  labelText: 'Username or Email',
                                  prefixIcon: const Icon(Icons.person),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter username or email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyTextFormFieldWidget(
                                  controller: passwordController,
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                AppButtons(
                                  width: width / 1.2,
                                  text: "Log in to continue",
                                  onPressed: () {
                                    item.getLoginToken(nameController.text,
                                        passwordController.text);
                                    if (_formKey.currentState!.validate()) {
                                      if (item.loginToken.value.token == null ||
                                          item.loginToken.value.token == '') {
                                        Fluttertoast.showToast(
                                            msg:
                                                "username or password is incorrect"
                                                    .toString(),
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER);
                                      } else {
                                        StorageService().setUserName(
                                            "username", nameController.text);
                                        Get.toNamed('/home');
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const CookiePage()));
                                        Fluttertoast.showToast(
                                            msg: "Successfully logged in",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER);
                                      }
                                    } else {
                                      autoMode = AutovalidateMode.always;
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      })),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    width: width / 1.2,
                    child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      // style: const ButtonStyle(backgroundColor: ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image(
                              image: AssetImage("lib/assets/images/google.png"),
                              height: 25.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Continue with google",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppButtons(
                    width: width / 1.2,
                    text: "Create a bubble account",
                    textcolor: Colors.white,
                    buttoncolor: Colors.black,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginCurveContainer(Color color, CustomClipper<Path>? clipper) {
    return ClipPath(
      child: Container(
        height: 200,
        //width: 400,
        color: color,
      ),
      clipper: clipper,
    );
  }

  Widget usernameWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onEditingComplete: () {
          focusNode.requestFocus();
        },
        controller: nameController,
        onChanged: (value) => () {
          controller.getLoginToken(
              nameController.text, passwordController.text);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter user name';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pink, Colors.deepPurple],
              ),
            ),
            child: const Icon(Icons.person_pin),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
            ),
          ),
          hintStyle: const TextStyle(height: 0.5),
          hintMaxLines: 1,
          contentPadding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusColor: Colors.deepPurple,
          hintText: "UserName",
          isDense: true,
        ),
      ),
    );
  }
}

class LoginDarkPinkCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 90);

    path.quadraticBezierTo(
        size.width / 2 - 50, size.height - 50, size.width, size.height - 170);
    path.lineTo(size.width, 20);

    var firstEndPoint = Offset(0.0, size.height - 120);
    var firstControlPoint = Offset(
      size.width / 2,
      size.height / 2,
    );
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LoginLightPinkCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
        size.width / 2 - 50, size.height - 30, size.width, size.height - 160);
    path.lineTo(size.width, 20);

    var firstEndPoint = Offset(0.0, size.height - 90);
    var firstControlPoint = Offset(
      size.width / 2,
      size.height / 2,
    );
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyTextFormFieldWidget extends StatelessWidget {
  final String labelText;

  final Widget? prefixIcon;

  final String? Function(String?)? validator;

  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onchange;
  final TextEditingController? controller;

  const MyTextFormFieldWidget({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.validator,
    this.inputFormatters,
    this.onchange,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: const BorderSide(
            color: Appcolors.appPink,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(
            color: Appcolors.buttonBorderColor,
            //  width: 2.0,
          ),
        ),
        labelStyle: const TextStyle(color: Appcolors.appPink),
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onChanged: onchange,
      controller: controller,
    );
  }
}
