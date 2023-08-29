import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({Key? key}) : super(key: key);

  final colorCustomGreen = const Color(0xFF34A48E);
  final corDoCardDosCampos = const Color(0xFF2B2A38);
  final colorBackgroundFooter = const Color(0xFF212129);
  final colorCustomYellow = const Color(0xFFE8E07E);

  final aquiVoceGerenciaSeusSeguros =
      "Aqui você gerencia seus seguros e de seus familiares em poucos cliques!";

  final bemVindo = "Bem vindo!";
  final seguradoras = "Seguradora".toUpperCase();
  final tokioMarine = "Tokio Marine".toUpperCase();
  final resolve = "Resolve".toUpperCase();
  final tokio = "Tokio".toUpperCase();

  final acesseAtravesDasRedes = "Acesse através das redes sociais";
  final pathIconGoogle = 'assets/images/icon_google.png';
  final pathIconFacebook = 'assets/images/icon_facebook.png';
  final pathIconTwitter = 'assets/images/icon_twitter.png';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: colorBackgroundFooter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.transparent,
              height: ((MediaQuery.of(context).size.height / 100) * 28),
            ),
          ],
        ),
      ),
    );
  }
}
