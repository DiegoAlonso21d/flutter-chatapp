import 'package:flutter/material.dart';
import 'package:realtime_chat_proyect/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Logo(
                    logo:
                        "https://png.pngtree.com/png-clipart/20230111/original/pngtree-register-now-banner-design-transparent-background-png-image_8901766.png",
                  ),
                  _Form(),
                  Labels(
                    ruta: "login",
                    label1: "¿Ya tienes una cuenta?",
                    label2: "Ingresa ahora!",
                  ),
                  Text(
                    "Terminos y condiciones de uso",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.perm_identity,
          placeholder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nameCtrl,
        ),
        CustomInput(
          icon: Icons.mail_lock_outlined,
          placeholder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        CustomInput(
          icon: Icons.lock_clock_outlined,
          placeholder: 'Contraseña',
          textController: passCtrl,
          isPassword: true,
        ),
        ButtomRed(
          icon: Icons.arrow_forward_rounded,
          text: 'Registrar',
          onTap: () {
            print(emailCtrl.text);
            print(passCtrl.text);
          },
        )
      ]),
    );
  }
}
