import 'dart:html';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/bloc/cartListBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i)=>CartListBloc())
      ],
      child: MaterialApp(
        title: "Food Delivery",
        home: Home(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}

class Home extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
    body: SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[
            FirstHalf();
          ],
        ),
      ),
    )
    );
  }
}
