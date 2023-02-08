import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String logo;
  const Logo({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.only(top: 30),
      width: 170,
      child: Column(children: [
        Image(image: NetworkImage(this.logo)),
        SizedBox(
          height: 30,
        ),
        Text(
          "Messenger",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                )
              ]),
        )
      ]),
    ));
  }
}
