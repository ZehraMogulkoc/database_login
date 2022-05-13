
import 'dart:convert';
import 'page1.dart';
import 'page2.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
void main(){
  runApp(loginApp());
}
//main page with login screen
String username='';
class loginApp extends StatelessWidget {
  const loginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
      routes: <String, WidgetBuilder>{
        '/page1': (BuildContext context )=>homePage(),
        '/page2': (BuildContext context )=>registerPage(),
        '/LoginPage': (BuildContext context )=>loginPage(),
      },
    );
  }
}
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController user=TextEditingController();
  TextEditingController pass=TextEditingController();
//user is gonna write username and password to log in

 Future<List?> login()async{
   Uri myUri = Uri.parse("http://10.0.2.2/login/login.php");
   final response=await http.post(myUri,body:{
     //connect to login.php file and check if user exits and the password is correct. I f it is, then log in
     "username": user.text,
     "password": pass.text,
   });
   var datauser=json.decode(response.body);
   if(true){
     Navigator.pushReplacementNamed(context, '/page1');
   }
   setState(() {
     username=datauser[0]['username'];
   });

 }

//uı part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body:Column(
          children: [
            TextField(
              autocorrect: true,
              controller: user,
              decoration: InputDecoration(
                  icon: Icon(Icons.mail_outline),
                  hintText: 'User Name'
              ),
            ),
            TextField(
              autocorrect: true,
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  hintText: 'Password'
              ),
            ),
            RaisedButton(child: Text('Login'),onPressed: (){
login();

            }),
            RaisedButton(child: Text('Register '),onPressed: (){
              Navigator.pushReplacementNamed(context, '/page2');
            })
          ],
        )
    );
  }
}
