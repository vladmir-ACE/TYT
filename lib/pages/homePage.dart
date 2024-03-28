import 'package:flutter/material.dart';
import 'package:tyt/services/Translate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textControl = TextEditingController();
  TextEditingController textTranslateControl = TextEditingController();

  TranslateService translateService = TranslateService();

  bool loading = false;

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
                        decoration: const InputDecoration(
                          hintText: "Enter your text here",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
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
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () async {
                      // start loading
                      setState(() => loading = true);
                      String text = textControl.text;
                      String result =
                          await translateService.translateText(text);
                          // fisnish loading and replace translate text 
                      setState(() {
                        textTranslateControl.text = result;
                        loading = false;
                      });
                    },
                    child: loading?const CircularProgressIndicator(
                     
                      color: Colors.white,
                    ):const Text("Translate your Text"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Text("TRANSLATE TEXT IN FRENCH"),
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
