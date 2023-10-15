import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Constant/app_images.dart';
import '../../Constant/app_string.dart';
import '../../Controller/button.dart';
import '../../Controller/textfield.dart';
import '../../Element/trxtfield.dart';
import '../../Style/colors.dart';
import '../../Utils/Notifier/login_notifier.dart';
import '../../Validation/validation.dart';

LoginScreen({expirince=true}) => ChangeNotifierProvider<LoginNotifier>(
      create: (_) => LoginNotifier(),
      child: Builder(builder: (context) => LoginProvider(context: context)),
    );

class LoginProvider extends StatelessWidget {
  const LoginProvider({Key? key, required BuildContext context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
        builder: (context, state, child) => Scaffold(
          resizeToAvoidBottomInset: true,
            body:Center(
              child: Form(
                key: state.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
               child: Padding(padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const Text(AppString.title,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
               Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(20))),
               customTextField(double.infinity, loginEmail, (value) => emailValidation(value),   state.focusNode[0] ,  "Email",),
               SizedBox(height: 15,),
                    customTextField(double.infinity, loginPassword, (value) => passwordValidation(value), state.focusNode[1] , "password",obscureText: state.isVisible,suffixIcon: state.isVisible == false? AppImages.visible:AppImages.hide,onTap: (){state.visiblePassword(); print("password");}),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Checkbox(activeColor: Colors.orange,
                              value: state.isCheck, onChanged:(value) {state.selectCheckBox(value);}),

                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(AppString.rememberMe,style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w300,fontSize: 16),),
                          )
                        ],
                    ),
                    Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(35))),
                    customButton( (){ state.Checkvalidation(context);}, AppColors.green, "Sign In",),
                  ] )
               )),

             ),));
  }
}