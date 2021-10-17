
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eltl5awy/CategoriesModel.dart';
import 'dart:convert';
import 'ProductModel.dart';
class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  var Listofproducts=[];
  Future getcategories()async{
    var responceP= await http.get(Uri.parse("https://retail.amit-learning.com/api/categories"));
    List lop=jsonDecode(responceP.body)["categories"];
    print(lop[0]);
    for( var m in lop){
      Listofproducts.add(CategoriesModel.fromjson(m));
    }
    return Listofproducts;

  }
  @override
  void initState() {
    super.initState();
    getcategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Home Page"),
        ),
        body: FutureBuilder(
            future:getcategories() ,
            builder:(BuildContext context,AsyncSnapshot snapShout){
              return (
                  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder:(context,index){
                      return builditem(Listofproducts[index]);
                    },
                    itemCount: Listofproducts.length,
                  )
              );
            }
        )
    );
  }
  Widget builditem(CategoriesModel c){
    return Center(
      child: Stack(alignment: AlignmentDirectional.center,
        children: [
          Image.network(c.avatar.toString()),
          Container(
            color: Colors.grey[300],
            child:Text(c.name.toString(),style: TextStyle(fontSize: 40),) ,

          )
        ],

      ),
    );

  }
}




