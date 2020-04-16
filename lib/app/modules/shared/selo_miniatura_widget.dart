import 'package:fidelizaapp/app/theme/color/light_color.dart';
import 'package:flutter/material.dart';

double _width;
double _seloMiniaturaHeight1 = 210; //altura do primeiro card/selo

double _seloMiniaturaWidth1 = .50; //largura do primeiro card/selo

double _seloMiniaturmarginHorizontal = 10; //margin horizontal do card/selo
double _seloMiniaturmarginVertical = 20; //margin vertical do card/selo
double _seloMiniaturbordaCircular = 20; //efeito da borda circular do card/selo

double _seloMiniaturaHeight_vazio = .25;
double _seloMiniaturaWidth_vazio = .50; //largura do restante dos cards/selos

Widget seloMiniatura(
    {Color primary = Colors.green,
    String imgPath,
    String estabelecimento,
    String titulo = '',
    String selos = '',
    Color chipColor = LightColor.orange,
    bool isPrimaryCard = false,
    double width}) {
  _width = width;
  return Container(
    height: _seloMiniaturaHeight1,
    width: _width * _seloMiniaturaWidth1,
    margin: EdgeInsets.symmetric(
        horizontal: _seloMiniaturmarginHorizontal,
        vertical: _seloMiniaturmarginVertical),
    decoration: BoxDecoration(
      color: primary.withAlpha(200),
      borderRadius:
          BorderRadius.all(Radius.circular(_seloMiniaturbordaCircular)),
    ),
    child: Container(
      child: Stack(
        children: <Widget>[
          _estabelecimento(estabelecimento, Color(0xff5a5d85)),
          _imagemSeloMiniatura(imgPath),
          _infoSeloMiniatura(
              estabelecimento: estabelecimento,
              titulo: titulo,
              selos: selos,
              textColor: LightColor.titleTextColor,
              primary: chipColor,
              isPrimaryCard: isPrimaryCard),
        ],
      ),
    ),
  );

  /*
  Container(
    height: isPrimaryCard ? _seloMiniaturaHeight1 : _seloMiniaturaHeight2,
    width: isPrimaryCard
        ? _width * _seloMiniaturaWidth1
        : _width * _seloMiniaturaWidth2,
    margin: EdgeInsets.symmetric(
        horizontal: _seloMiniaturmarginHorizontal,
        vertical: _seloMiniaturmarginVertical),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius:
          BorderRadius.all(Radius.circular(_seloMiniaturbordaCircular)),
    ),
    child: Row(
      children: <Widget>[
        Container(
            width: _width * 0.25,
            child: Stack(
              children: <Widget>[
                _imagemSeloMiniatura(imgPath),
              ],
            )),
        Column(
          children: <Widget>[
            Container(
              width: _width * 0.24,
              height: (_width * 0.5) - 20,
              decoration: BoxDecoration(
                color: primary.withAlpha(200),
                borderRadius: BorderRadius.all(
                    Radius.circular(_seloMiniaturbordaCircular)),
              ),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              //color: Colors.red,
              child: Text('thiago'),
            )
          ],
        )
      ],
    ),
  );
  */
}

Widget seloMiniaturaVazio(
    {Color primary = Colors.green,
    String imgPath,
    String estabelecimento,
    String titulo = '',
    String selos = '',
    Color chipColor = LightColor.orange,
    bool isPrimaryCard = false,
    double width}) {
  _width = width;
  return Container(
    //alignment: Alignment.center,
    height: _width * _seloMiniaturaHeight_vazio,
    width: _width * _seloMiniaturaWidth_vazio,
    margin: EdgeInsets.symmetric(
        horizontal: _seloMiniaturmarginHorizontal,
        vertical: _seloMiniaturmarginVertical),
    decoration: BoxDecoration(
      color: primary.withAlpha(200),
      borderRadius:
          BorderRadius.all(Radius.circular(_seloMiniaturbordaCircular)),
    ),
    child: Container(
      child: Stack(
        children: <Widget>[
          _estabelecimento(estabelecimento, Color(0xff5a5d85)),
          //_imagemSeloMiniatura(imgPath),
          _infoSeloMiniatura(
              estabelecimento: estabelecimento,
              titulo: titulo,
              selos: selos,
              textColor: LightColor.titleTextColor,
              primary: chipColor,
              isPrimaryCard: isPrimaryCard),
        ],
      ),
    ),
  );
}

Widget _estabelecimento(String estabelecimento, Color textColor) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
    child: Text(
      estabelecimento,
      maxLines: 1,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}

Widget _imagemSeloMiniatura(String imgPath) {
  return Positioned(
      top: 30,
      left: 10,
      width: _width * 0.45,
      height: _width * 0.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imgPath,
          fit: BoxFit.cover,
        ),
      )

      // CircleAvatar(
      //   backgroundColor: Colors.grey.shade300,
      //   // backgroundImage: NetworkImage(imgPath),
      // )
      );
}

Widget _infoSeloMiniatura(
    {String estabelecimento,
    String titulo,
    String selos,
    Color textColor,
    Color primary,
    bool isPrimaryCard = false}) {
  return Positioned(
      bottom: 20,
      left: 10,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              width: _width * .45,
              alignment: Alignment.topLeft,
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isPrimaryCard ? Colors.white : textColor),
              ),
            ),
            SizedBox(height: 10),
            _chip(selos, primary, height: 10, isPrimaryCard: isPrimaryCard)
          ],
        ),
      ));
}

Widget _chip(String selos, Color textColor,
    {double height = 0, bool isPrimaryCard = false}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.green
        //color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
        ),
    child: Text(
      selos,
      style: TextStyle(
          color: isPrimaryCard ? Colors.white : Colors.white, fontSize: 12),
      //color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
    ),
  );
}

// Widget container1() {
//   return Container(
//     margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//     child: new Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           new Container(
//             child: new Image.network(
//               'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//               fit: BoxFit.fill,
//               width: 145.0,
//               height: 145.0,
//             ),
//             color: const Color(0xFFe60303),
//             padding: const EdgeInsets.all(0.0),
//             alignment: Alignment.center,
//             width: 145.0,
//             height: 50.0,
//           ),
//           new Container(
//             child: new Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   new Container(
//                     color: const Color(0xFFffb6b6),
//                     padding: const EdgeInsets.all(0.0),
//                     alignment: Alignment.center,
//                     width: 70.0,
//                     height: 85.0,
//                   ),
//                   new Container(
//                     color: const Color(0xFF800505),
//                     padding: const EdgeInsets.all(0.0),
//                     alignment: Alignment.center,
//                     width: 70.0,
//                     height: 85.0,
//                   )
//                 ]),
//             color: const Color(0xFF361111),
//             padding: const EdgeInsets.all(0.0),
//             alignment: Alignment.center,
//             width: 145.0,
//             height: 90.0,
//           )
//         ]),
//     color: const Color(0xFFd95252),
//     padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//     alignment: Alignment.center,
//     width: _width * 0.5,
//     height: 180.0,
//   );
// }
