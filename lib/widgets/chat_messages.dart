import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;
  const ChatMessages(
      {super.key,
      required this.texto,
      required this.uid,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            curve: Curves.easeInOutCirc, parent: animationController),
        child: Container(
          child: this.uid == "123" ? _myMessage() : _noMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 50, right: 5),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(offset: Offset(1, 1), color: Colors.black, blurRadius: 1)
          ]),
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 136, 207, 251),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _noMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 5, right: 50),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
