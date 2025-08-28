

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int qty = 0;
  
  @override
  void initState() {
    qty = 1;
    super.initState();
  }

  void increase() {
    qty++;
    setState(() {}); // refresh data
    // print(qty);
  }

  void decrease() {
    qty--;
    setState(() {}); // refresh data
    // print(qty);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        
      //   title: Text(
      //     "Calculator",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.amber,
      //   elevation: 10,
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.message)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blueGrey,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Text(
              qty.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              IconButton(onPressed: decrease, icon: Icon(Icons.remove)),
              SizedBox(width: 20),
              IconButton(onPressed: increase, icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}