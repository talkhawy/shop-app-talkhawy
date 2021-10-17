import 'package:flutter/material.dart';
import 'package:eltl5awy/Home.dart';
import 'package:eltl5awy/Categories.dart';
class Homes extends StatefulWidget {

  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  int myindex =0;
  var classes=[Home(),Categories()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex:myindex ,
        onTap: (index){
          setState(() {
            myindex=index;
          });
        },
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("home"),backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.category),title: Text("categories"),backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title: Text("cart"),backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.menu),title: Text("menu"),backgroundColor: Colors.grey),
        ],
      ),
      body: classes[myindex],

    );
  }
}
