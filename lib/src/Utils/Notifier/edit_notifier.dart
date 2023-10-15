
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Element/trxtfield.dart';


File? image;
class EditNotifier extends ChangeNotifier{
  List<FocusNode> focusNode = [FocusNode(), FocusNode(),FocusNode(), FocusNode()];

  final picker = ImagePicker();


  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile!.path);
    }
    notifyListeners();
  }

  String? name;
  String? password;
  show() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    Name.text  = pre.getString("passeword") ?? "";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    email.text = prefs.getString("email") ?? "";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    work.text = sharedPreferences.getString("work") ?? "";
   // work.text= "5+";
    print(work.text);

    notifyListeners();


  }
  initState(){
    show();
  }
  Savedta()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email",email.text) ;
    String Email = preferences.getString("email") ?? "";
    print(Email);
    preferences.setString("passeword",Name.text) ;
    String name = preferences.getString("passeword") ?? "";
    print(name);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("work",work.text) ;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("skill",skill.text) ;
    notifyListeners();

  }

}