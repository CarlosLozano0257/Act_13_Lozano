import 'package:flutter/material.dart';
import 'paginas/compras.dart';
import 'paginas/detallecompra.dart';
import 'paginas/buscar.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Compras',
      initialRoute: '/',
      routes: {
        '/': (context) => const Pagina1(), // Pagina1 ahora vuelve a ser Mis Compras
        '/pagina2': (context) => const Pagina2(),
        '/pagina3': (context) => const Pagina3(),
      },
    );
  }
}