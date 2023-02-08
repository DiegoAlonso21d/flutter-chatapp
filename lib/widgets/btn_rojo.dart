import 'package:flutter/material.dart';

class ButtomRed extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData icon;

  const ButtomRed(
      {super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 17, 0),
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.only(left: 18),
        width: double.infinity,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(this.icon),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
