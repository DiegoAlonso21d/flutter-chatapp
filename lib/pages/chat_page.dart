import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_proyect/widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessages> _messages = [];

  bool _estaEscribiendo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Text(
                  "Di",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Diego Alonso",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (_, i) => _messages[i],
            reverse: true,
          )),
          Divider(
            height: 1,
          ),

          //Todo:Caja de texto
          Container(
            color: Colors.white,
            child: _inputChat(),
          )
        ],
      )),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: [
        Flexible(
            child: TextField(
          controller: _textController,
          onSubmitted: _handleSubmit,
          onChanged: (String texto) {
            //Todo: cuando hay un valor para poder enviar
            setState(() {
              if (texto.trim().length > 0) {
                _estaEscribiendo = true;
              } else {
                _estaEscribiendo = false;
              }
            });
          },
          decoration: InputDecoration.collapsed(hintText: "Enviar mensaje..."),
          focusNode: _focusNode,
        )),

        //Boton de enviar

        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          child: Platform.isIOS
              ? CupertinoButton(
                  child: Text("Enviar"),
                  onPressed: _estaEscribiendo
                      ? () => _handleSubmit(_textController.text.trim())
                      : null,
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.send,
                      ),
                      onPressed: _estaEscribiendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    ),
                  ),
                ),
        )
      ]),
    ));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) {
      return;
    }

    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessages(
      texto: texto,
      uid: "123",
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 700)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: Off del Socket

    //TODO:

    for (ChatMessages message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
