import 'package:flutter/material.dart';
import 'package:horizontal_list_view/horizontal_list_view.dart';
import 'package:picture_app_fadi/features/list_view/screens/details_screen.dart';
import 'package:picture_app_fadi/features/list_view/repositories/gallery_data.dart';

class PictureWidget extends StatefulWidget {
  const PictureWidget({super.key});

  @override
  State<PictureWidget> createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  final HorizontalListViewController _controller =
      HorizontalListViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 200),
              HorizontalListView.builder(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                controller: _controller,
                itemCount: galleryData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      title: galleryData[index].imageTitle,
                                      description:
                                          galleryData[index].imageDescription,
                                      imagePath: galleryData[index].imagePath,
                                    )));
                      },
                      child: Container(
                        height: 250,
                        color: Colors.orange,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 220,
                              width: 200,
                              child: Image.asset(
                                galleryData[index].imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              galleryData[index].imageTitle,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            )
                          ],
                        ),
                      ));
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () {
                      _controller.animateToPage(
                        _controller.currentPage - 1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linearToEaseOut,
                      );
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const SizedBox(width: 100),
                  IconButton.filled(
                    onPressed: () {
                      _controller.animateToPage(
                        _controller.currentPage + 1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linearToEaseOut,
                      );
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
