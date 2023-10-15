import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant/app_string.dart';
import '../HomeScreen/home_screen.dart';
import '../LoginScreen/login_screen_vc.dart';
class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => SpleshScreenState();
}

class SpleshScreenState extends State<SpleshScreen> {
  static const String loginKey = "login";

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text(AppString.myProfile, style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),)
    );
  }

  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool(loginKey);
    Timer(const Duration(seconds: 2),
            () {
          if (isLogin != null) {
            if (isLogin) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => HomeScreen()
                  )
              );
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => LoginScreen()
                  )
              );
            }
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => LoginScreen()
                )
            );
          }
        }

    );
  }
}
