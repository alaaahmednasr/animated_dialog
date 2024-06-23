import 'package:animated_dialog/animated_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Dialog',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        title: const Text(
          "Custom Animated Dialog",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAnimatedDialog(
                      context: context,
                      dialogAnimatedIconPath: "assets/animatedIcon.json",
                      dialogContentText:
                      "Are You Sure You Want To Delete This Item",
                      needTwoButtons: true,
                      mainButtonText: 'Yes Delete',
                      mainButtonOnPressed: () {
                        Navigator.pop(context);
                      },
                      additionalButtonText: 'No Cancel',
                      additionalButtonOnPressed: () {
                        Navigator.pop(context);
                      },
                      needAdditionalButtonOutline: true,
                      additionalButtonTextColor: Colors.red,
                      additionalButtonBorderColor: Colors.red,
                    );
                  },
                );
              },
              child: const Text("click"),
            ),
          ],
        ),
      ),
    );
  }
}
