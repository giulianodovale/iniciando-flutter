import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(new PerguntApp());
}

class _PerguntaAppState extends State<PerguntApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual a cor Favorita",
      "respostas": [
        {"texto": "Preto", "pontuacao": 10},
        {"texto": "Vermelho", "pontuacao": 10},
        {"texto": "Branco", "pontuacao": 10},
        {"texto": "Azul", "pontuacao": 10},
      ]
    },
    {
      "texto": "Qual o seu animal favorito?",
      "respostas": [
        {"texto": "Gato", "pontuacao": 10},
        {"texto": "Cachorro", "pontuacao": 10},
        {"texto": "Leão", "pontuacao": 10},
        {"texto": "Macaco", "pontuacao": 10},
      ]
    },
    {
      "texto": "Qual o seu Instrutor favorito?",
      "respostas": [
       {"texto": "Maria","pontuacao":3},
       {"texto": "João","pontuacao":5},
       {"texto": "Giuliano","pontuacao":10},
       {"texto": "Nenhum","pontuacao":7},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(()
    {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Meu Título')),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}

class PerguntApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return new _PerguntaAppState();
  }
}
