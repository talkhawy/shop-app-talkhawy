import 'package:flutter/material.dart';
import 'package:eltl5awy/Home.dart';
import 'Homes.dart';
import 'SignUP.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Forma extends StatefulWidget {


  @override
  _FormaState createState() => _FormaState();
}

class _FormaState extends State<Forma> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Sign In"),
      ),

      body: Form(
          key: formkey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller:emailcontroller ,
                decoration: InputDecoration(
                    hintText: "enter your email",
                    suffixIcon: Icon(Icons.email)

                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "enter your email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "enter your password",
                    suffixIcon: Icon(Icons.password)


                ),

                validator: (value){
                  if(value==null||value.isEmpty){
                    return "enter your password";
                  }
                  return null;
                },


              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(child: Text("login"),
                  onPressed: (){


                    if (formkey.currentState!.validate()) {
                      login(emailcontroller.text, passcontroller.text,context);

                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),


                      );
                    }
                  },


                ),
              ),
              InkWell(child: Text("Go SignUp"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return SignUp();
                  }));
                },),
            ],
          )

      ),
    );
  }
}
login(String email,String password,BuildContext context) async{
  final response=await http.post(
    Uri.parse('https://retail.amit-learning.com/api/login'),
    headers: <String, String>{
      'Content-Type':'application/json',
    },
    body: jsonEncode(<String, String>{
      'email':email,
      'password':password,
    }),
  );
  if(response.statusCode==200){
    print("user logged Successfully");
    print(jsonDecode(response.body)["token"]);
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Homes();
    }));

  }
  else{
    throw Exception("failed to create acount");
  }

}
