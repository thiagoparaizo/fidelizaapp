import 'package:fidelizaapp/app/modules/shared/navegacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'introduction_controller.dart';

class IntroductionPage extends StatefulWidget {
  final String title;
  const IntroductionPage({Key key, this.title = "Introduction"})
      : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState
    extends ModularState<IntroductionPage, IntroductionController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Scaffold(
          bottomNavigationBar: BottomNavigation(MenuNavegacao.HOME_PAGE),
          body: Column(
            children: <Widget>[
              _header(context),
              SizedBox(height: 20),
              _boxFiltro(),
              _conteudo(context),
            ],
          ),
        ));
  }
}

Widget _header(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
    child: Container(
        height: 100,
        width: width,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 50,
                left: 0,
                child: Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: <Widget>[
                        Align(
                            //alignment: Alignment.center,
                            child: Text(
                          "Meus Selos",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ))
                      ],
                    ))),
          ],
        )),
  );
}

Widget _conteudo(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  print('width: $width');

  return Expanded(
    child: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: width * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Texto..'),
                        )),
                    Container(
                      //width: 200,
                      //height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Image(
                          width: width * 0.3,
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXFqau06O5V0EzWoS7NgGPxVGenv_QwqQqpkPEaJEVydyece41&usqp=CAU'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _boxFiltro() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'filtrar',
        icon: new Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
      validator: (value) => value.isEmpty ? 'filtro inválido' : null,
    ),
  );
}
