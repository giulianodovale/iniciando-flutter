import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 15) {
      return "Parabéns!";
    } else if (pontuacao < 18) {
      return "Você é bom!";
    } else if (pontuacao < 24) {
      return "Impressionante!";
    } else {
      return "O Novo Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28),
      )),
      FlatButton(
        onPressed: quandoReiniciarQuestionario,
        child: Text(
          "Reiniciar?",
          style: TextStyle(fontSize: 28),
        ),
        textColor: Colors.blue,
      )
    ]);
  }
}
