import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Constant/app_images.dart';
import '../../Constant/app_string.dart';
import '../../Controller/button.dart';
import '../../Style/colors.dart';
import '../../Utils/Notifier/edit_notifier.dart';
import '../../Utils/Notifier/home_notifier.dart';
import '../EditProfile/edit_profile_screen.dart';
import '../LoginScreen/login_screen_vc.dart';


HomeScreen({bool ? expirince}) => ChangeNotifierProvider<HomeNotifier>(
  create: (_) => HomeNotifier(),
  child: Builder(builder: (context) => HomeScreenProvider(context: context,expirince:expirince)),
);
class HomeScreenProvider extends StatelessWidget {
  bool? expirince;
   HomeScreenProvider({Key? key,required BuildContext context,this.expirince}) : super(key: key){

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  var state = Provider.of<HomeNotifier >(context, listen: false);
  state.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeNotifier>(
        builder: (context, state, child) => Scaffold(
            appBar: AppBar(elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.white,

              actions: [
                IconButton(
                  icon: const Icon(Icons.logout_outlined,color: AppColors.black), // Change to your logout icon
                  onPressed: ()async {
    return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
    return AlertDialog(
    title: const Text(AppString.areYouSure),
    actions: <Widget>[
    InkWell(onTap:(){Navigator.pop(context);}, child: const Padding(
      padding: EdgeInsets.only(right: 25.0,bottom: 15),
      child: Text(AppString.no,style: TextStyle(color: AppColors.black, fontWeight: FontWeight.normal, fontSize: 16),),
    )),
    InkWell(onTap:()async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("email");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen()));
    }, child: const Padding(
      padding: EdgeInsets.only(right: 25, bottom: 15),
      child: Text(AppString.yes,style: TextStyle(color: AppColors.orenge, fontWeight: FontWeight.normal, fontSize: 16)),
    )),
    ],
    );
    },
    );
    }

    ),
              ],
            ),
          body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(AppString.myProfile,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(25))),
                Align( alignment: Alignment.center,child:   image == null
                    ? CircleAvatar(radius: 55,
                    child: Image.asset(
                      AppImages.user,
                      fit: BoxFit.cover,
                    ))
                    : CircleAvatar(radius: 55,

                    backgroundImage:FileImage(
                      image!,

                    )),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.name,style: TextStyle(color: AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                Text(state.name??"",style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.email,style: TextStyle(color: AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                Text(state.email??"" ,style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.skill,style: TextStyle(color: AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(8))),
                SizedBox(height: 30,
                  child: expirince==false? ListView.builder(scrollDirection:Axis.horizontal ,
                      itemCount:  state.skill!.length ,
                      itemBuilder: (context ,index) {
                        return Container(height: 35,decoration: const BoxDecoration(),child: Text(state.skill![index],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.black,),));/* Container( height: 5,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),child: Text(skill.text![index]));*/
                      }): ListView.builder(scrollDirection:Axis.horizontal ,
                      itemCount:  state.skillList.length ,
                      itemBuilder: (context ,index) {
                        return Container(height: 35,decoration: const BoxDecoration(),child: Text(state.skillList[index].title!,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.black,),),);/* Container( height: 5,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),child: Text(skill.text![index]));*/
                      }),
                ),

                //  Text(state.skill??"" ,style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.workExperience,style: TextStyle(color: AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(8))),
                expirince==false?  Text(state.workexp??"" ,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),):Text("5+years" ,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                customButton( (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditScreen(/*workexp:state.workexp*/)));}, AppColors.green, AppString.editProfile),

              ],)),
          )),
      /*SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(AppString.myProfile,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(25))),
                Align( alignment: Alignment.center,child:  Container(decoration: const BoxDecoration(shape:BoxShape.circle ),child: Image.asset(AppImages.user,fit: BoxFit.cover,))),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.name,style: TextStyle(color: AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                Text(state.name??"",style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.email,style: TextStyle(color:AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                Text(state.email??"" ,style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.skill,style: TextStyle(color:AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),

                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))), SizedBox(
                child: expirince==false? SizedBox(height:50,
                  child: ListView.builder(scrollDirection:Axis.horizontal ,
                      itemCount:  state.skill!.length ,
                      itemBuilder: (context ,index) {
                        return Container(decoration: const BoxDecoration(),child: Text(state.skill![index],style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.black),));*//* Container( height: 5,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),child: Text(skill.text![index]));*//*
                      }),
                ): ListView.builder(scrollDirection:Axis.horizontal ,
                    itemCount:  state.skillList.length ,
                    itemBuilder: (context ,index) {
                  return Container(height: 35,decoration: const BoxDecoration(),child: Text(state.skillList[index].title!,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color:AppColors.black),),);*//* Container( height: 5,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),child: Text(skill.text![index]));*//*
                }),
              ),

              //  Text(state.skill??"" ,style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                const Text(AppString.workExperience,style: TextStyle(color: AppColors.pink,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(8))),
                expirince==false?  Text(state.workexp??"" ,style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),):const Text("5+years" ,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                customButton( (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditScreen(*//*workexp:state.workexp*//*)));}, AppColors.green, AppString.editProfile),

            ],)),
          )),*/
        );
  }
}
