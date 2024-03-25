import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textControl = TextEditingController();
  TextEditingController textTranslateControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Text("ENTER YOUR TEXT"),
                      TextField(
                        controller: textControl,
                        maxLines: 10,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Enter your text here"),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () {},
                    child: Text("Translate your Text"),
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Text("TRANSLATE TEXT"),
                      TextField(
                        readOnly: true,
                        controller: textTranslateControl,
                        maxLines: 10,
                       
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
