import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customTextField(
    double width,
    TextEditingController controller,
    FormFieldValidator validator,
    FocusNode focusNode,


   String hintText,{double? height,  bool? obscureText , VoidCallback? onTap, String ? suffixIcon, int ?maxLength, bool ? readOnly,Color? cursorColor,Function(String?)? onSaved}) {
  return SizedBox(
    width: width,
    child: TextFormField(
        cursorColor: cursorColor ?? Colors.black,
        readOnly: false,
        maxLength:maxLength ,
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      onSaved: onSaved,
      decoration: InputDecoration(
          focusColor: Colors.grey,
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.green,width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.grey,width: 1.5)),

      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
      fillColor: Colors.white,suffixIcon: suffixIcon!=null ? InkWell(onTap: onTap,child: const Icon (Icons.visibility_off)):null )),
  );
}