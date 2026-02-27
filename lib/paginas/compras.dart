import 'package:flutter/material.dart';

// ==========================================
// 1. PANTALLA PRINCIPAL (Mis Compras)
// ==========================================
class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  Widget _crearItemCompra(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detallecompra');
        },
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // AQUÍ ESTÁ TU IMAGEN DE GITHUB
                child: Image.network(
                  'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/gameshop.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("26.02.26", style: TextStyle(fontSize: 14, color: Colors.black54)),
                  SizedBox(height: 5),
                  Text("H9FOC45", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detallecompra');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text("Detalles", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.g_mobiledata, color: Colors.blue, size: 40),
        title: const Text("Mis Compras", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          // Icono del carrito (ahora solo decorativo o para futuras funciones)
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black), 
            onPressed: () {
              // Puedes dejar esto vacío por ahora
            },
          ),
          const SizedBox(width: 5),
          const Icon(Icons.face, color: Colors.black),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _crearItemCompra(context),
          _crearItemCompra(context),
          _crearItemCompra(context),
        ],
      ),
      // Pasamos 0 para que la "Casita" (Home) se pinte de azul
      bottomNavigationBar: _crearBottomNav(context, 0),
    );
  }
}

// ==========================================
// BARRA DE NAVEGACIÓN INFERIOR
// ==========================================
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
        // Usa pushReplacementNamed para no amontonar pantallas
        Navigator.pushReplacementNamed(context, '/'); 
      } else if (index == 1 && indexActual != 1) {
        Navigator.pushReplacementNamed(context, '/buscar'); 
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 30), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: 30), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 30), label: ''),
    ],
  );
}