import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String label1;
  final String label2;

  const Labels(
      {super.key,
      required this.ruta,
      required this.label1,
      required this.label2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          this.label1,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, this.ruta);
          },
          child: Text(
            this.label2,
            style: TextStyle(
              color: Color.fromARGB(255, 240, 16, 0),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }
}
