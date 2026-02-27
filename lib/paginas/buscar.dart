import 'package:flutter/material.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.g_mobiledata, color: Colors.blue, size: 40),
        title: const Text("Buscar",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_cart_outlined, color: Colors.blue),
          SizedBox(width: 15),
          Icon(Icons.face, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // Barra de búsqueda grande
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar en mis compras...',
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
      // Aquí pasamos el index '1' para que la lupa se pinte de azul
      bottomNavigationBar: _crearBottomNav(context, 1),
    );
  }
}

// Reutilizamos la barra
Widget _crearBottomNav(BuildContext context, int indexActual) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    currentIndex: indexActual,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.black,
    onTap: (index) {
      if (index == 0 && indexActual != 0) {
        // Regresa al Home (Mis Compras)
        Navigator.pushReplacementNamed(context, '/');
      }
    },
    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 30), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: ''),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 30), label: ''),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30), label: ''),
    ],
  );
}