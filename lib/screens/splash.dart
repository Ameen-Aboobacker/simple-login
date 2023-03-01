import 'package:flutter/material.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/screens/home.dart';
import 'package:sample_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState(){
    checkUserLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Ameen.jpg'),
      ),
    );
  }

   gotoLogin() {
     Future.delayed(const Duration(seconds:5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => const ScreenLogin(),
    ));
  }
  Future checkUserLogin() async{
    final sharedPrefs=await SharedPreferences.getInstance();
    final userLogin=sharedPrefs.getBool(savekeyname);
    if(userLogin==null||userLogin==false){
      gotoLogin();
    }else{
       Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (contxt)=>const Home()));
    }
  }
}
