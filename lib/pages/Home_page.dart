import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:modernlogintute/components/Drawer.dart';
import 'package:modernlogintute/components/category_HomePage.dart';
import 'package:modernlogintute/pages/Campaigns_card.dart';
import 'package:modernlogintute/pages/profile_page.dart';
import 'package:modernlogintute/pages/settingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  var controller = InfiniteScrollController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Blood Buddy",
        ),
        // backgroundColor: Colors.red,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1699250896~exp=1699251496~hmac=256da86a78e0928b9a628c53e4e2c00ad87e9c3af1b932182c797e59ec98fec5'),
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
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryCard(
                    icon: Icons.bloodtype_outlined, categoryName: "Donate"),
                CategoryCard(
                  icon: Icons.medical_services,
                  categoryName: "Hospital",
                ),
                CategoryCard(
                  icon: CupertinoIcons.drop,
                  categoryName: " Drop",
                )
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                CampaignCards(
                  CampaignImagePath:
                      'https://img.freepik.com/free-vector/flat-vertical-poster-template-world-blood-donor-day_23-2150334098.jpg?w=740&t=st=1699338772~exp=1699339372~hmac=c670531b7ad1719c10bd87748987289470a52238c430f6fafc248003dcea96be',
                  Rating: '4.8',
                  CampaignName: 'Blood Matters',
                ),
                CampaignCards(
                  CampaignImagePath:
                      'https://img.freepik.com/free-vector/flat-vertical-poster-template-world-blood-donor-day_23-2150334098.jpg?w=740&t=st=1699338772~exp=1699339372~hmac=c670531b7ad1719c10bd87748987289470a52238c430f6fafc248003dcea96be',
                  Rating: '4.8',
                  CampaignName: 'Blood Matters',
                ),
                CampaignCards(
                  CampaignImagePath:
                      'https://img.freepik.com/free-vector/flat-vertical-poster-template-world-blood-donor-day_23-2150334098.jpg?w=740&t=st=1699338772~exp=1699339372~hmac=c670531b7ad1719c10bd87748987289470a52238c430f6fafc248003dcea96be',
                  Rating: '4.8',
                  CampaignName: 'Blood Matters',
                ),
                CampaignCards(
                  CampaignImagePath:
                      'https://img.freepik.com/free-vector/flat-vertical-poster-template-world-blood-donor-day_23-2150334098.jpg?w=740&t=st=1699338772~exp=1699339372~hmac=c670531b7ad1719c10bd87748987289470a52238c430f6fafc248003dcea96be',
                  Rating: '4.8',
                  CampaignName: 'Blood Matters',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
