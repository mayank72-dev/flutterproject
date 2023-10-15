import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/model.dart';

class HomeNotifier extends ChangeNotifier {
  String? name;
  String?email;
  String ?workexp;
  String? skill;
  List<User>  skillList =[User(title: "c",),User(title: "c++")];
  show() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
   name  = pre.getString("passeword") ?? "";
    print(name);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email") ?? "";
    print("Email${email}");
  /*  SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString("email") ?? "";*/
  notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    workexp= pref.getString("work") ?? "";
    print("workexpyear::${workexp}");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    skill= sharedPreferences.getString("skill") ?? "";
    print("skill::${skill}");

notifyListeners();
  }
  initState(){
   show();
  }
}