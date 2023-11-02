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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Blood Buddy",
        ),
        backgroundColor: Colors.red,
      ),
      drawer: MyDrawer(
        onProfileTap: () {
          goToProfilePage(context);
        },
        onSignOut: signUserOut,
        // onSignOut: signOut,
      ),
      // body: Center(
      //   child: Text(
      //     'LOGGED IN AS : ' + user.email!,
      //     style: TextStyle(
      //       fontSize: 20,
      //     ),
      //   ),
      // ),

      // code for carousel

      // body: ListView(
      //   children: [
      //     SizedBox(
      //       height: 200,
      //       child: InfiniteCarousel.builder(
      //         itemCount: 10,
      //         itemExtent: 200,
      //         center: true,
      //         anchor: 0.0,
      //         velocityFactor: 0.2,
      //         onIndexChanged: (index) {},
      //         controller: controller,
      //         axisDirection: Axis.horizontal,
      //         loop: true,
      //         itemBuilder: (context, itemIndex, realIndex) {
      //           return Container(
      //             margin: EdgeInsets.symmetric(
      //               horizontal: 10,
      //               vertical: 10,
      //             ),
      //             decoration: BoxDecoration(
      //               // color: Colors.yellow,
      //               borderRadius: BorderRadius.circular(20),
      //               image: DecorationImage(
      //                 fit: BoxFit.fill,
      //                 image: NetworkImage(
      //                   "https://th.bing.com/th/id/OIP.96pE9_DfC28g2hnGl_fnFQHaHa?pid=ImgDet&rs=1",
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     )
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        fixedColor: Colors.red,
        currentIndex: currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Explore",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
            ),
            label: "Saved",
          ),
          // const BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.settings,
          //   ),
          //   label: "Settings",
          // ),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
