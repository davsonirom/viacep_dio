import 'package:flutter/material.dart';

class CabecalhoViaCep extends StatelessWidget {
  const CabecalhoViaCep({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: size.width,
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  alignment: Alignment.centerLeft,
                  "https://viacep.com.br/estatico/images/viacep.png.pagespeed.ce.I80LiA6qpr.png"),
              const Text(
                "Consulte CEPs de todo o Brasil",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.yellow,
          height: 8,
          width: size.width,
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black54),
              children: [
                TextSpan(text: "Utilize nosso serviço,"),
                TextSpan(
                  text: " GRATUITO",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                        " e de alto desempenho para consultar Códigos de Endereçamento Postal (CEP) do Brasil."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
