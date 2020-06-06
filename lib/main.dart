import 'dart:html';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
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

class FirstHalf extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 30),
          title(),
          SizedBox(height: 30),
          searchBar(),
          SizedBox(height: 30),
          Categories(),
        ],
        ),
    );
  }
}

Widget categories() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryLisItem(
          categoryIcon : Icons.bug_report,
          categoryName : "Burgers",
          avialability : 12,
          selceted : false,
        ),

        CategoryLisItem(
          categoryIcon : Icons.bug_report,
          categoryName : "Burgers",
          avialability : 12,
          selceted : true,
        ),
      ],
    ),
  );
}


Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(Icons.search,
        color: Colors.black45,

      ),
      SizedBox(width: 20,),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle: TextStyle(
              color: Colors.black87
            ),
          ),
        ),
      )
    ],
  )
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 45),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Food",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            )
          ),
          Text("Delivery",
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 30
          )
          )
        ],
      )
    ],
  )
}


class CustomAppBar extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          GestureDetector(
            onTap: () {},
              child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Text("0"),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(50)
              ),
            ),
          )
        ],
      ),
    );
  }
}

 class CategoryListItem extends StatelessWidget {

    final IconData categoryIcon;
    final String categoryName;
    final int availability;
    final bool selected;

    CategoryListItem(
      {
        @required this.categoryIcon,
        @required this.categoryName,
        @required this.availability,
        @required this.selected
      }
    );

   @override 
   Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Color(0xfffeb324) : Colors.white,
        border: Border.all(
          color: selected ? Colors.transparent : Colors.grey[200],
          width: 1.5
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(25,0),
            spreadRadius: 5
          )
        ]
      ),
     );
   }
 }