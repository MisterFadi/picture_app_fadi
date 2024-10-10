import 'package:flutter/material.dart';
import 'package:picture_app_fadi/features/list_view/screens/about_me_widget.dart';
import 'package:picture_app_fadi/features/list_view/screens/picture_widget.dart';
import 'package:picture_app_fadi/features/list_view/screens/video_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Widget> bottomNav = [
    const PictureWidget(),
    const VideoWidget(),
    const AboutMeWidget(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text(
              "MyGallery",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: bottomNav[currentIndex],
          bottomNavigationBar: NavigationBar(
            indicatorColor: Colors.orange,
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              currentIndex = index;
              setState(() {});
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.photo),
                label: "Picture",
              ),
              NavigationDestination(
                icon: Icon(Icons.videocam_sharp),
                label: "Videos",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "About Me",
              ),
            ],
          ),
        ));
  }
}
