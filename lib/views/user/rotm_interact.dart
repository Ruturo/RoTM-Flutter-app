import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:rotm/models/rotmStatCard.dart';
import 'package:rotm/userdata.dart';
import 'package:rotm/views/RotmInteractServices/services_gridview.dart';

class UserInteractionMenu extends StatefulWidget {
  const UserInteractionMenu({super.key});

  @override
  State<UserInteractionMenu> createState() => _UserInteractionMenuState();
}

class _UserInteractionMenuState extends State<UserInteractionMenu> {
  // ignore: non_constant_identifier_names
  void ExtractUserRequest() async {
    var url = Uri.parse('${EndPoint}extract');
    var queryParams = {"id": BRoTM_UserID};
    var response = await http.get(url.replace(queryParameters: queryParams));
    var responseData =
        jsonDecode(response.body); // Add this line to parse the JSON response
    var repoData = responseData["report"];
    var temp = responseData["temp"];
    var resp = responseData["resp"];
    var sleep = responseData["sleep"];
    var pulse = responseData["pulse"];
    var oxy = responseData["oxy"];
    // Store the "temp" array in a variable
    UserRespData = resp;
    UserTempData = temp;
    UserRepoData = repoData;
    UserOxyData = oxy.toDouble();
    UserPulseData = pulse.toDouble();
    UserSleepData = sleep.toDouble();
  }

  @override
  void initState() {
    super.initState();
    ExtractUserRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            const ROTMStatCard(),
            Container(
              height: MediaQuery.of(context).size.height - 480,
              width: 400,
              color: Colors.deepPurple.shade900,
              child: const InteractiveServices(),
            ),
          ],
        ),
      ),
    );
  }
}

//Medical Based LLM to talk with the user
