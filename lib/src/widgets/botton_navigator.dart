import 'package:dio_lab_flutter_dio_podcast/src/util/custom_color.dart';
import 'package:flutter/material.dart';

class BottonNavigator extends StatelessWidget {
  const BottonNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomColor.pink700,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Pesquisar",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Categorias",
          icon: Icon(Icons.grid_view),
        ),
        BottomNavigationBarItem(
          label: "Minha conta",
          icon: Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }
}
