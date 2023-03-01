import 'package:flutter/material.dart';
import 'package:sample_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME PAGE'),
       /* IconButton(
          autofocus: true,
            onPressed: () {
              signout(context);
            },
            icon: const Icon(Icons.exit_to_app_rounded ,),),*/
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(
                'Person $index',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'Messages ($index)',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: (index % 2 == 0)
                  ? CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 30,
                    )
                  : const Icon(Icons.person),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider(
              thickness: 5,
              color: Colors.black,
            );
          },
          itemCount: 30,
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        child:Icon(Icons.exit_to_app_rounded),
        onPressed: (){
signout(context);
      }
      ),
    );
  }

  signout(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const ScreenLogin()),
        (route) => false);
    final sprefs = await SharedPreferences.getInstance();
    await sprefs.clear();
  }
}
