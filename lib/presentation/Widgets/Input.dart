import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String nameKey;
  final String title;
  final Function(String, String) formUpdate;
  final Icon? prefixIcon; // Parámetro opcional para el ícono personalizado

  const Input({
    super.key,
    required this.formUpdate,
    required this.nameKey,
    required this.title,
    this.prefixIcon, // Este es el ícono opcional
  });

  @override
  State<Input> createState() => _Input();
}

class _Input extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          onChanged: (value) {
            widget.formUpdate(widget.nameKey, value);
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: "Escriba aquí...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), // 🔹 Más redondeado
              borderSide: BorderSide.none, // 🔹 Sin borde
            ),
            prefixIcon: widget.prefixIcon ?? Icon(Icons.person), // Usar el ícono personalizado o el por defecto
          ),
        )
      ],
    );
  }
}
