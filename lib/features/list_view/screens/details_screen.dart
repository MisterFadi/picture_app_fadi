import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const DetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text(
                "Detail Screen",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Image.asset(imagePath, fit: BoxFit.fill),
                const SizedBox(height: 30),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(description, textAlign: TextAlign.justify),
                ),
              ]),
            )));
  }
}
