import 'dart:math';
import 'package:bloodbuddy/pages/donation_screen.dart';
import 'package:bloodbuddy/pages/emergency_screen.dart';
import 'package:bloodbuddy/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloodbuddy/components/Drawer.dart';
import 'package:bloodbuddy/components/category_HomePage.dart';
import 'package:bloodbuddy/models/campaign.dart';
import 'package:bloodbuddy/pages/campaigns_card.dart';
import 'package:bloodbuddy/pages/profile_page.dart';
import 'package:bloodbuddy/pages/settingsPage.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  late Future<List<Campaign>> _futureCampaigns;

  void getData() {
    _futureCampaigns = Database().getCampaigns();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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

  //navigate to settings page
  void goToSettingsPage(BuildContext context) {
    //pop menu drawer
    Navigator.pop(context);

    //go to settings page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Blood Buddy",
          // style: TextStyle(
          //   color: Colors.deepPurple,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        // backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1699250896~exp=1699251496~hmac=256da86a78e0928b9a628c53e4e2c00ad87e9c3af1b932182c797e59ec98fec5'),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(
        onProfileTap: () {
          goToProfilePage(context);
        },
        onSignOut: signUserOut,
        // onSignOut: signOut,
        //on settings Tap
        onSettingsTap: () {
          goToSettingsPage(context);
        },
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
      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //app bar
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 25.0),
          //   child: Row(
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 4),
          //           Text(
          //             'Hello',
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 18,
          //             ),
          //           ),
          //           SizedBox(height: 4),
          //           Text(
          //             'Rajan Sudan',
          //             style: TextStyle(
          //               fontSize: 24,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 25),
          //card-> how do you feel?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  //animation or cute picture
                  Container(
                      height: 115,
                      width: 115,
                      child: Image.asset("assets/animation/animation1.gif")),
                  const SizedBox(width: 20),

                  //how do you feel + get dtarted button
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'How do you feel?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Fill out your medical card right now',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[300],
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: const EdgeInsets.all(8), //original was 12
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help you?'),
              ),
            ),
          ),
          const SizedBox(height: 25.0),

          //horizontal list view -> categories: blood , hospital , blood bank etc.
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: const DonationScreen(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: const CategoryCard(
                    icon: Icons.bloodtype_outlined,
                    categoryName: "Donate",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: const EmergencyScreen(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: const CategoryCard(
                    icon: Icons.medical_services,
                    categoryName: "Emergency",
                  ),
                ),
                // CategoryCard(
                //   image: Image.asset("assets/images/sperms.png",
                //       height: 30, width: 30),
                //   icon: CupertinoIcons.drop,
                //   categoryName: " Sperm",
                // )
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          // doctor list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Campaign\'s List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 210,
            child: FutureBuilder<List<Campaign>>(
                future: _futureCampaigns,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final campaigns = snapshot.data!;
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: List.generate(
                        campaigns.length,
                        (index) => CampaignCards(
                          campaign: campaigns[index],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
