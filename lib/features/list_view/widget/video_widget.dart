import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Videos sind momentan nicht verfügbar. \n Danke für ihr Verständnis",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
