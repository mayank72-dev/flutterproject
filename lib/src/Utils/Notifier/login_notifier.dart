import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Element/trxtfield.dart';
import '../../Page/HomeScreen/home_screen.dart';
import '../../Page/SpleshScreen/splesh_screen.dart';

class LoginNotifier extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();

  List<FocusNode> focusNode = [FocusNode(), FocusNode()];
  bool isCheck = false;
  bool isVisible = false;

  /// check box value
  selectCheckBox(value) {
    isCheck = value;
    notifyListeners();
  }

  /// visible password
  visiblePassword(){
    isVisible =! isVisible;
    print("passwordvalur${isVisible}");
    notifyListeners();
  }



  bool localAuth({
    required String login,
    required String password,
  }) {
    if (login == 'kalavadiyamayank72@gmail.com' && password == 'Mayank') {
      return true;
    } else {
      return false;
    }
  }


  void Checkvalidation(context) async {
    if (formKey.currentState!.validate()) {

      if (localAuth(login: loginEmail.text,password: loginPassword.text)) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('saveUser', isCheck);
        final pref = await SharedPreferences.getInstance();
        await pref.setString('email',loginEmail.text ,);
        final pre = await SharedPreferences.getInstance();
        await pre.setString('passeword', loginPassword.text ,);
        final sharedpref = await SharedPreferences.getInstance();
        sharedpref.setBool(SpleshScreenState.loginKey, true);
        const snackBar=  SnackBar(
          content: Text("successfully Login "),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen()));


        print("done");
      } else {
        const snackBar=  SnackBar(
          content: Text("Wrong Email and password"),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      notifyListeners();
    }
  }
}