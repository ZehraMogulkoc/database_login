import 'dart:convert';

import 'package:flutter/material.dart';
import 'edit_page.dart';
import 'main.dart';
import 'package:http/http.dart'as http;
//this is the home page that all users are listed
class homePage extends StatefulWidget {

  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}
List userList= [];
class _homePageState extends State<homePage> {
  //with http class, connect to php files and reach the all Data class
  getAllUsers()async{
    Uri myUri = Uri.parse("http://10.0.2.2/login/allData.php"); //10.0.2.2 is need to run on android emilators
    var response=await http.get(myUri);
    if(response.statusCode==200){
      setState(() {
        userList= json.decode(response.body);
      });
      //print(userList);
     return userList;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers(); //list all suers
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/LoginPage');
          },
          icon: Icon(Icons.home_outlined),
        ),
        title: Text('Welcome $username'),
      ),
      body: ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context,index){
      return ListTile( // list users id, name  and phone information
      leading: Text(userList[index]["id"]),
      title:Text(userList[index]["username"]) ,
      trailing: GestureDetector(child: Icon(Icons.edit),
        onTap: (){ //go to edit page
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(list: userList,index: index,),),);
          debugPrint('Edit Clicked');
        },),
        subtitle:Row(children:[ Text(userList[index]["mail"]??'mail not entered'),SizedBox(width: 20),Text( userList[index]["phone"]??'phone not entered')]) ,

      );
      }),
    );
  }
}
