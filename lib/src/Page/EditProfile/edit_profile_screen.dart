import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Constant/app_images.dart';
import '../../Constant/app_string.dart';
import '../../Controller/button.dart';
import '../../Controller/textfield.dart';
import '../../Element/trxtfield.dart';
import '../../Style/colors.dart';
import '../../Utils/Notifier/edit_notifier.dart';
import '../HomeScreen/home_screen.dart';

EditScreen({/*String? workexp */ expiexpirince = true}) =>
    ChangeNotifierProvider<EditNotifier>(
      create: (_) => EditNotifier(),
      child: Builder(
          builder: (context) => EditProfileScreenProvoder(
                context: context, /*workexp:workexp*/
              )),
    );

class EditProfileScreenProvoder extends StatelessWidget {
  /* String ?workexp;*/
  EditProfileScreenProvoder({
    Key? key,
    required BuildContext context,
    /*this. workexp*/
  }) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var state = Provider.of<EditNotifier>(context, listen: false);
      state.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditNotifier>(
        builder: (context, state, child) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Center(
                    child: Column(children: [
                      const Text(
                        AppString.editProfile,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(25))),
                      Stack(children: [
                        image == null
                            ? const CircleAvatar(radius: 55,
                                backgroundImage: AssetImage(
                                  AppImages.user,

                                ))
                            : CircleAvatar(radius: 55 ,
                                backgroundImage: FileImage(
                                  image!,)),
                        Positioned(
                            left: 40,
                            top: 50,
                            child: InkWell(
                                onTap: () {
                                  state.getImageFromGallery();
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: AppColors.black,
                                  size: 35,
                                )))
                      ]),
                      Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(20))),
                      customTextField(
                        double.infinity,
                        Name,
                        (value) => null,
                        state.focusNode[0],
                        "Name",
                        obscureText: false,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                      customTextField(
                        double.infinity,
                        email,
                        (value) => null,
                        state.focusNode[1],
                        "Email",
                        obscureText: false,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                      customTextField(
                        double.infinity,
                        skill,
                        (value) => null,
                        state.focusNode[2],
                        "Skill",
                        obscureText: false,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                      customTextField(double.infinity, work, (value) => null,
                          state.focusNode[3], "Expirince", obscureText: false,
                          onSaved: (value) {
                        /*workexp;*/
                      }),
                      Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                      customButton(() async {
                        return showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content:  Text(
                                AppString.forgot,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              title: const Text(AppString.notdave),
                              actions: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          right: 25.0, bottom: 15),
                                      child: Text(
                                        AppString.discardChange,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                      ),
                                    )),
                                InkWell(
                                    onTap: () async {
                                      state.Savedta();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomeScreen(
                                                  expirince: false)));
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          right: 25, bottom: 15),
                                      child: Text(AppString.okay,
                                          style: TextStyle(
                                              color: AppColors.orenge,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16)),
                                    )),
                              ],
                            );
                          },
                        );
                      }, Colors.green, AppString.save),
                    ]),
                  )),
            )));
  }
}
