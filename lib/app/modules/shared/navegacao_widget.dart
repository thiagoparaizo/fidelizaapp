import 'package:fidelizaapp/app/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum MenuNavegacao { HOME_PAGE, X_PAGE_1, X_PAGE_2, PROFILE_PAGE }

Widget BottomNavigation(MenuNavegacao nav) {
  int index = nav.index;
  int atualIndex = index;

  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: LightColor.purple,
    unselectedItemColor: Colors.grey.shade300,
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    items: [
      _bottomIcons(Icons.home),
      _bottomIcons(Icons.star_border),
      _bottomIcons(Icons.book),
      _bottomIcons(Icons.person),
    ],
    onTap: (index) {
      print(index);

      switch (index) {
        case 0:
          if (atualIndex != 0) {
            Modular.to.pushReplacementNamed('/home/');
          } else {
            print('atualIndex != 0');
          }

          break;

        case 1:
          if (atualIndex != 1) {
            Modular.to.pushReplacementNamed('/intro/');
          } else {
            print('atualIndex != 1');
          }
          break;

        case 2:
          if (atualIndex != 2) {
            //Modular.to.pushReplacementNamed('/profile/');
          } else {
            print('atualIndex != 2');
          }
          break;

        case 3:
          if (atualIndex != 3) {
            Modular.to.pushReplacementNamed('/profile/');
          } else {
            print('atualIndex != 3');
          }
          break;

        default:
      }
    },
  );
}

BottomNavigationBarItem _bottomIcons(IconData icon) {
  return BottomNavigationBarItem(
      //  backgroundColor: Colors.blue,
      icon: Icon(icon),
      title: Text(""));
}
