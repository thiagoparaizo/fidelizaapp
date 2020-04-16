import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fidelizaapp/app/shared/auth/auth_controller.dart';
import 'package:fidelizaapp/app/modules/shared/selo_miniatura_widget.dart';
import 'package:fidelizaapp/app/theme/color/light_color.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  Widget listaSelosMiniatura(double width) {
    if (false) {
      return seloMiniaturaVazio(
          width: width,
          primary: Colors.white,
          chipColor: LightColor.orange,
          estabelecimento: "",
          titulo: "Você ainda não possuí selos.",
          selos: "Buscar Promoção",
          isPrimaryCard: false,
          imgPath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXFqau06O5V0EzWoS7NgGPxVGenv_QwqQqpkPEaJEVydyece41&usqp=CAU");
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: retornarLista(10, width),
          ),
        ),
      );
    }
  }

  List<Widget> retornarLista(int qtd, double width) {
    int count = 0;
    List<Widget> list = [];
    while (count <= qtd) {
      list.add(seloMiniatura(
          width: width,
          primary: Colors.white,
          chipColor: LightColor.orange,
          estabelecimento: "Puro Açaí",
          titulo: "Complete 10 selos e ganha 500ml de açaí.",
          selos: "8 Selos",
          isPrimaryCard: false,
          imgPath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXFqau06O5V0EzWoS7NgGPxVGenv_QwqQqpkPEaJEVydyece41&usqp=CAU"));
      list.add(seloMiniatura(
          width: width,
          primary: Colors.white,
          chipColor: LightColor.seeBlue,
          estabelecimento: "Dog Goggy",
          titulo: "Junte 30 selos e ganha um Hot Dog completo!",
          selos: "2 Selos",
          imgPath:
              "https://static-images.ifood.com.br/image/upload/f_auto,t_high/logosgde/201705260911_ef802ca8-0fc6-4287-b232-c85fd42b362e.png"));
      list.add(seloMiniatura(
          width: width,
          primary: Colors.white,
          chipColor: LightColor.lightOrange,
          estabelecimento: "Cervejaria DomDom",
          titulo: "Junte 25 selos e ganha 1 cerveja especial grátis!",
          selos: "22 Selos",
          imgPath:
              "https://i0.wp.com/rockbreja.com/wp-content/uploads/2014/10/backer.jpg?fit=650%2C335&ssl=1"));

      list.add(seloMiniatura(
          width: width,
          primary: Colors.white,
          chipColor: LightColor.seeBlue,
          estabelecimento: "Barbearia Top Hair",
          titulo: "Junte 10 selos e ganha um corte grátis.",
          selos: "3 Selos",
          imgPath:
              "https://i.pinimg.com/originals/de/7a/d6/de7ad64b093e745891bc2243a82b6a0c.png"));

      count++;
    }

    return list;
  }
}
