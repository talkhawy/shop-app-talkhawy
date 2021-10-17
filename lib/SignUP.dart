import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eltl5awy/Form.dart';
import 'package:eltl5awy/Home.dart';
class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("register"),
      ),
      body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "enter your email",
                  suffixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "enter your email";
                  }
                  if(value.contains("@")){
                    return null;
                  }
                  else {
                    return "your email mut have @";
                  }


                },
              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                    hintText: "enter your name",
                    suffixIcon: Icon(Icons.person)
                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "enter your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
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
                  if(value.length<6){
                    return "your password must be at least 6 char";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(child: Text("sign up"),
                  onPressed: (){

                    if (formkey.currentState!.validate()) {
                      register(namecontroller.text, emailcontroller.text, passcontroller.text,context);

                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                ),
              ),
              Text("have an account"),
              InkWell(child: Text("Go Login"),onTap: (){
                return Navigator.pop(context);
              },)
            ],
          )
      ),
    );
  }
}
register(String name,String email,String password,BuildContext context) async{
  final response=await http.post(
    Uri.parse('https://retail.amit-learning.com/api/register'),
    headers: <String, String>{
      'Content-Type':'application/json',
    },
    body: jsonEncode(<String, String>{
      'name':name,
      'email':email,
      'password':password,
    }),
  );
  if(response.statusCode==201){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Forma();
    }));
    print("user Registered Successfully");
    print(jsonDecode(response.body)["token"]);
  }
  else{
    throw Exception("failed to create acount");
  }
}