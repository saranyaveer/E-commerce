import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sample_project/services/db_service.dart';

import 'package:sample_project/services/storage_service.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    StorageService.init();
    DbServices.init();
    checkNetwork();
    super.initState();
  }

  String username = '';

  Future getData() async {
    setState(() {
      username = StorageService().getUserName("username")!;
    });
  }

  checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      showSnackBarGreen(context, "Connected to internet");
    } else {
      showSnackBarRed(context, "No network connection");
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(const Duration(seconds: 3));
    getData().whenComplete(() async {
      username == '' ? Get.toNamed('/login') : Get.toNamed('/bottombar');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: SizedBox(
          child:
              // Image.network(
              //     "https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BsYXNoJTIwc2NyZWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60")
              Text(
            'Loading...',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  void showSnackBarGreen(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBarRed(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
