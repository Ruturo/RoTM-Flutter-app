// ignore_for_file: unused_import

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:rotm/views/auth/signup_page.dart';
import 'package:rotm/views/dashboardSections/Section2Services/respiratory_rate.dart';

class SectionLevelTwo extends StatefulWidget {
  const SectionLevelTwo({super.key});

  @override
  State<SectionLevelTwo> createState() => _SectionLevelTwoState();
}

class _SectionLevelTwoState extends State<SectionLevelTwo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            // Navigation to a Page
          },
          child: Container(
            height: 130,
            width: (130 * 2) + 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ClipRRect(
          //Important Woidget
          borderRadius: BorderRadius.circular(20),
          child: OpenContainer(
            closedColor: const Color.fromARGB(255, 255, 255, 255),
            closedBuilder: (context, action) {
              return Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const UserRespirationRate(),
              );
            },
            openBuilder: (context, action) => const UserRespirationRate(),
          ),
        ),
      ],
    );
  }
}
