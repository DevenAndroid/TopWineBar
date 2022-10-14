import 'package:traidbiz/res/app_assets.dart';
import 'package:traidbiz/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ServerErrorUi extends StatefulWidget {
  const ServerErrorUi({Key? key}) : super(key: key);

  @override
  State<ServerErrorUi> createState() => _ServerErrorUiState();
}

class _ServerErrorUiState extends State<ServerErrorUi> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Image.asset(
              AppAssets.imgServerError,
              height: 240,
              width: 280,
            ),
            Image.asset(
              AppAssets.imgErrorOops,
              height: 100,
              width: 100,
            ),
            const Text(
              'We can\'t seems to find a page you \n are looking for',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'Code - ${Get.arguments[1]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ))),
              onPressed: () {
                Get.back();
                // Respond to button press
              },
              child: const Text('Go back'),
            )
          ],
        ),
      )),
    );
  }
}
