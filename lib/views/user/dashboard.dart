// ignore: unused_import
import 'dart:ffi';
// ignore: unused_import
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotm/models/userdragablescroll.dart';
import 'package:rotm/models/week_data.dart';
import 'package:rotm/views/dashboardSections/section1.dart';
import 'package:rotm/views/dashboardSections/section2.dart';
import 'package:rotm/views/dashboardSections/section3.dart';
import 'package:rotm/views/dashboardSections/section4.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.deepPurple.shade900,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.deepPurple.shade900,
              ),
              child: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: Image.asset("lib/assets/animated/menu2.gif"),
              ),
            ),
          ),
          title: Center(
            child: Text("DASHBOARD",
                style: GoogleFonts.getFont(
                  'Orbitron',
                  fontSize: 25,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                )),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple.shade900,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                height: 60,
                width: 60,
                child: IconButton(
                  icon: Image.asset(
                    "lib/assets/animated/profile.gif",
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const UserDragScrollBottomSheet();
                      },
                    );
                  },
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepPurple.shade900,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  children: [
                    Image.asset(
                      "lib/assets/images/logo.png",
                      height: 120.0, // Adjust the height as needed
                      width: 100.0, // Adjust the width as needed
                    ),
                    Text(
                      "BRoTM",
                      style: GoogleFonts.getFont(
                        'Orbitron',
                        fontSize: 45,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Add other drawer items below if needed
            ],
          ),
        ),
        body: const Column(
          children: [
            SizedBox(
              height: 21,
            ),
            WeekDataSection(),
            // Just for testing out stuff
            SizedBox(
              height: 4,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SectionLevelFour(),
                    SizedBox(
                      height: 15,
                    ),
                    LevelOneSection(),
                    SizedBox(
                      height: 15,
                    ),
                    SectionLevelTwo(),
                    SizedBox(
                      height: 15,
                    ),
                    SectionLevelThree(),
                    SizedBox(
                      height: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
