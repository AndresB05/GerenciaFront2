import 'package:flutter/material.dart';

const LinearGradient kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF61D8D8), Color(0xFF67E4B8)], // 🎨 Definir colores
  begin: Alignment.topCenter, // 📌 Inicia en la parte superior
  end: Alignment.bottomCenter, // 📌 Termina en la parte inferior
);

const LinearGradient kPrimaryGradientBody= LinearGradient(
  colors: [Color(0xFF67E4B8), Color(0xFF61D8D8)], // 🔄 Colores invertidos
  begin: Alignment.topCenter, // 📌 Inicia en la parte superior
  end: Alignment.bottomCenter, // 📌 Termina en la parte inferior
);

const Color primaryColor = Color(0xFF67E4B9);