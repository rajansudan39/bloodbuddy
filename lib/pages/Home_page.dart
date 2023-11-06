// ignore: file_names, avoid_web_libraries_in_flutter

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:modernlogintute/components/Drawer.dart';
import 'package:modernlogintute/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // navigate to profile page
  void goToProfilePage(BuildContext context) {
    //pop menu drawer
    Navigator.pop(context); // problem

    //go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  var controller = InfiniteScrollController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // centerTitle: true,
      //     // title: Text(
      //     //   "Blood Buddy",
      //     // ),
      //     // backgroundColor: Colors.red,
      //     ),
      drawer: MyDrawer(
        onProfileTap: () {
          goToProfilePage(context);
        },
        onSignOut: signUserOut,
        // onSignOut: signOut,
      ),

      //bottom naviagtion bar

      // bottomNavigationBar: BottomNavigationBar(
      //   // backgroundColor: Colors.black,
      //   fixedColor: Colors.red[500],
      //   currentIndex: currentIndex,
      //   items: [
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: "Home",
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.search,
      //       ),
      //       label: "Explore",
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.bookmark_border,
      //       ),
      //       label: "Saved",
      //     ),
      //   ],
      //   onTap: (value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      // ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: [
                  Text('Hello, '),
                ],
              ),
            )

            //card-> how do you feel?

            //search bar

            //horizontal list view -> categories: blood , hospital , blood bank etc.

            // doctor list
          ],
        ),
      ),
    );
  }
}
