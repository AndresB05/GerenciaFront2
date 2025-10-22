import 'package:flutter/material.dart';
import 'package:greenflow/constants/theme.dart';

class AppBarGreenFlow extends StatelessWidget implements PreferredSizeWidget { // 🔥 Implementa PreferredSizeWidget
  final String title;

  const AppBarGreenFlow({super.key, required this.title});



  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        fit: BoxFit.scaleDown, // 📌 Reduce el tamaño si es necesario
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white, 
              fontSize: 30, 
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      toolbarHeight: 80,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30), // 📌 Bordes redondeados
        ),
      ),
    );
  }

  // ✅ Definir el tamaño preferido
  @override
  Size get preferredSize => const Size.fromHeight(80); // 📌 Coincide con toolbarHeight
}
