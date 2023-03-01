import 'package:flutter/material.dart';
import 'package:sample_project/screens/home.dart';
import 'package:sample_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDataMatched=true;
  final _key=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('UserName'),
                  ),
                   validator: (value){
                  /*if(_isDataMatched){
                    return null;
                  }
                  else{
                    return 'error';
                  }*/
                  if(value==null||value.isEmpty){
                    return 'field is empty';
                  }
                  else{
                    return null;
                  }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                 
                    label: Text('password'),
                  ),
                  validator: (value){
                  /*if(_isDataMatched){
                    return null;
                  }
                  else{
                    return 'error';
                  }*/
                  if(value==null||value.isEmpty){
                    return 'field is empty';
                  }
                  else{
                    return null;
                  }
                  },
                ),
              
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: const Text(
                      'Incorrect Username or Password',

                      style: TextStyle(color: Colors.red),
                    )),
                    ElevatedButton.icon(
                      onPressed: () {
                        if(_key.currentState!.validate()){
                          checkLogin(context);
                        }
                        else{
                          print('Data is Empty');
                        }
                        
                      },
                      icon: Icon(Icons.check),
                      label: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext contxt) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'ameen' && password=='1234') { 
      final sprefs=await SharedPreferences.getInstance();
      await sprefs.setBool(savekeyname, true);
      setState(() {
        _isDataMatched=true;
      });
      if(!mounted){}
      Navigator.pushReplacement(contxt, MaterialPageRoute(builder: (contxt)=>const Home(),),);
    } else {

      setState(() {
        _isDataMatched=false;
      });
    }
  }
}
