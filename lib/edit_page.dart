import 'package:database_login/page1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({required this.list,required this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {

  TextEditingController username = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController phone = TextEditingController();

//connect with edit.php file
  addUpdateData(){
      var url = 'http://ip//login/edit.php'; //use your own ip
      Uri myUri = Uri.parse(url);
      http.post(myUri,body: {
        'id' : widget.list[widget.index]['id'], // find the correct id so that change the related users info
        'username' : username.text,
        'mail ' : mail.text, //updating info
        'phone' : phone.text,
      });


  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit "),),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: 'user name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: mail,
              decoration: InputDecoration(
                labelText: 'mail',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
          ),


          Padding(padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: (){
                setState(() {
                  addUpdateData();
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),),);
                debugPrint('Clicked RaisedButton Button');
              },
              color: Colors.blue,
              child: Text('Update',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}