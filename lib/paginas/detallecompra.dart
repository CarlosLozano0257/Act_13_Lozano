import 'package:flutter/material.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.g_mobiledata, color: Colors.blue, size: 40),
        title: const Text("Detalles Compra", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black), 
        actions: const [
          Icon(Icons.shopping_cart_outlined, color: Colors.black), // Icono negro porque no estamos en el carrito
          SizedBox(width: 15),
          Icon(Icons.face, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _crearCuadroImagenYDetalles('https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/rblxlogo.jpg', 'Roblox', '\$450 MXN'),
                  _crearCuadroImagenYDetalles('https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/mclogo.jpg', 'Minecraft', '\$500 MXN'),
                  _crearCuadroImagenYDetalles('https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/gd.jpg', 'Geometry dash', '\$250 MXN'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CAMBIO: ESTADO PAGADO
                  const Text("ESTADO: PAGADO", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  // CAMBIO: TEXTO ENRIQUECIDO PARA PINTAR SOLO EL COSTO DE AZUL
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: const [
                        TextSpan(text: "Fecha: 24 de Octubre\n"),
                        TextSpan(text: "Costo Total: "),
                        TextSpan(
                          text: "\$1,200 MXN", 
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold) // Costo en azul
                        ),
                        TextSpan(text: "\nCompra: H9FOC45"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Descripción:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("El paquete fue entregado en la puerta principal. El producto incluye garantía de 1 año directamente con el fabricante."),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _crearBottomNav(context, 0),
    );
  }

  // Cuadro de imagen con costo en azul
  Widget _crearCuadroImagenYDetalles(String url, String nombre, String costo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(url, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  costo,
                  style: const TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Barra de navegación inferior
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
        Navigator.popUntil(context, ModalRoute.withName('/'));
      } else if (index == 1 && indexActual != 1) {
        Navigator.pushReplacementNamed(context, '/pagina3');
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