import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenflow/presentation/Screens/LoginScreen.dart';
import 'package:greenflow/presentation/Screens/MenuScreen.dart';
import 'package:greenflow/presentation/Screens/RegisterScreen.dart';
import 'package:greenflow/presentation/Screens/product_list_screen.dart';

// Removed HomeScreen import
// import 'package:greenflow/presentation/Screens/HomeScreen.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => Loginscreen()),

    // Removed HomeScreen route
    // GoRoute(
    //   path: '/home',
    //   pageBuilder: (context, state) => CustomTransitionPage(
    //     child: Homescreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return SlideTransition(
    //         position: Tween<Offset>(
    //           begin: Offset(0.0, 0.3), // 📌 Comienza desde abajo
    //           end: Offset.zero, // 📌 Llega a su posición normal
    //         ).animate(CurvedAnimation(
    //           parent: animation,
    //           curve: Curves.easeOutExpo, // 📌 Hace que la animación sea más natural
    //         )),
    //         child: ScaleTransition(
    //           scale: Tween<double>(
    //             begin: 0.9, // 📌 Inicia un poco más pequeño
    //             end: 1.0, // 📌 Llega a su tamaño normal
    //           ).animate(CurvedAnimation(
    //             parent: animation,
    //             curve: Curves.easeOutExpo, // 📌 Suaviza la entrada
    //           )),
    //           child: FadeTransition(
    //             opacity: animation, // 📌 Agrega un desvanecimiento
    //             child: child,
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // ),,
    GoRoute(path: '/login', builder: (context, state) => Loginscreen()),
    GoRoute(path: '/register', builder: (context, state) => Registerscreen()),
    GoRoute(path: '/home', builder: (context, state) => Menuscreen()),
    // GoRoute(
    //   path: '/product/:id', // Ruta dinámica con ID
    //   builder: (context, state) {
    //     final String productId = state.pathParameters['id'] ?? '0';
    //     return ProductScreen(productId: productId);
    //   },
    // ),
  ],
);
