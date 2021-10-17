import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
String? name;
Image? image;
Widget Stacks({required Image image,required String name}){
  return  Padding(
    padding: const EdgeInsets.all(30.0),
    child: Center(
      child: Stack(
        children: [
          Container(
            child: Image.asset("${image}"),
          ),
          Container(
            child: Text("${name}",style: TextStyle(fontSize: 50),),
          )

        ],
      ),
    ),
  );

}