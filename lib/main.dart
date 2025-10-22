import 'package:flutter/material.dart';
import 'package:greenflow/providers/authentication/login_provider.dart';
import 'package:greenflow/routes/all_routes.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
providers: [
ChangeNotifierProvider(create: (_) => AuthenticationProvider()), // Registro del provider
],
child: MyApp(),
));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Oculta la marca de debug
      title: 'GreenFlow',
      routerConfig: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/counter_provider.dart';
// import 'screens/home_screen.dart';`

// `void main() {
// runApp(
// MultiProvider(
// providers: [
// ChangeNotifierProvider(create: (_) => CounterProvider()), // Registro del provider
// ],
// child: MyApp(),
// ),
// );
// }