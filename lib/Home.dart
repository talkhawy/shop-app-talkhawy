
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ProductModel.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var Listofproducts = [];

  Future getProducts() async {
    var responceP = await http.get(
        Uri.parse("https://retail.amit-learning.com/api/products"));
    List lop = jsonDecode(responceP.body)["products"];
    print(lop[0]);
    for (var m in lop) {
      Listofproducts.add(product.fromjson(m));
    }
    return Listofproducts;
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Home Page"),
        ),
        body: FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapShout) {
              return (
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return builditem(Listofproducts[index]);
                    },
                    itemCount: Listofproducts.length,
                  )
              );
            }
        )
    );
  }

  Widget builditem(product p) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Container(
          child: Column(
            children: [
              Image.network(p.image.toString(), height: 175, width: 175,),
              SizedBox(height: 10,),
              Text(p.name.toString()),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Icon(Icons.add)),
                  Text("${p.price.toString()} EGP",
                    style: TextStyle(fontSize: 30),),

                ],
              )
              /*Column(
                children: [
                  Text(p.price.toString()),
                  //Text(p.description.toString())
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }


}
