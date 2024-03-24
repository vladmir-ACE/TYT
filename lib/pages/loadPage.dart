import 'dart:math';

import 'package:flutter/material.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 11, 93, 160),
            Color.fromARGB(255, 159, 210, 184),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage("assets/logo.png"),
              width: MediaQuery.of(context).size.width * 0.65,
            ), //Image
            const SizedBox(width: 20),
            const Text(
              "TranslateYourText",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Start"))
          ],
        ),
      ),
    );
  }
}
