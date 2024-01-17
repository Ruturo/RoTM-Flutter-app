import 'package:flutter/material.dart';

class InteractiveServices extends StatefulWidget {
  const InteractiveServices({super.key});

  @override
  State<InteractiveServices> createState() => _InteractiveServicesState();
}

class _InteractiveServicesState extends State<InteractiveServices> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 163, 39, 39),
            ),
            height: 100,
            width: 100,
            child: const Text("1"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 163, 39, 39),
            ),
            height: 100,
            width: 100,
            child: const Text("1"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 163, 39, 39),
            ),
            height: 100,
            width: 100,
            child: const Text("1"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 163, 39, 39),
            ),
            height: 100,
            width: 100,
            child: const Text("1"),
          ),
        ),
      ],
    );
  }
}
