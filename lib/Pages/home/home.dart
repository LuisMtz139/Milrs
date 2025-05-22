import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home/tareasCompletadas.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_application_1/Pages/botonesBar.dart'; // Aquí importas SOLO tu barra de navegación

// --- HEADER CON SEPARACIÓN --- //
class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 54,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Icon(
                      Icons.notifications_none,
                      color: Color(0xFF265FE6),
                      size: 28,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF265FE6), width: 2.4),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 21,
                      backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/women/68.jpg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hola Amanda!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Color(0xFF2176FF),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Tienes 3 tareas sin completar',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              CircularPercentIndicator(
                radius: 28.0,
                lineWidth: 5.0,
                percent: 0.6,
                animation: true,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Color(0xFFE6F7FF),
                progressColor: Color(0xFFFF9800),
                center: Text(
                  "60 %",
                  style: TextStyle(
                    color: Color(0xFFFF9800),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- SECCIÓN POR COMPLETAR --- //
class PorCompletarSection extends StatelessWidget {
  const PorCompletarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Encabezado: Por completar + Ver todo
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Row(
                children: const [
                  Icon(Icons.expand_more, color: Color(0xFF919FB1), size: 22),
                  SizedBox(width: 1),
                  Text(
                    "Por completar",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Color(0xFF212B36),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Acción de "Ver Todo"
                },
                child: const Text(
                  "Ver Todo",
                  style: TextStyle(
                    color: Color(0xFF5996FF),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Card de tarea pendiente (diseño según imagen)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF7FBFF),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A5996FF),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Etiqueta "Tarea" y menú
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3FAFA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Tarea',
                          style: TextStyle(
                            color: Color(0xFF38B48C),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: Color(0xFFAAB6C7),
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  // Descripción de la tarea
                  const Text(
                    "Descargar el último formato subido en la sección de documentos preliminares nom TMX_054_2025-23",
                    style: TextStyle(
                      color: Color(0xFF212B36),
                      fontSize: 14.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Fila: Estado y Fecha
                  Row(
                    children: const [
                      Icon(
                        Icons.error_outline,
                        color: Color(0xFFF7665E),
                        size: 17,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "Atrasada",
                        style: TextStyle(
                          color: Color(0xFFF7665E),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 13),
                      Text(
                        "4 mar. 2025",
                        style: TextStyle(
                          color: Color(0xFF8D97A7),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Fila de avatares y acciones
                  Row(
                    children: [
                      // Avatares
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 20,
                            child: CircleAvatar(
                              radius: 13,
                              backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/32.jpg",
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 13,
                            backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/women/44.jpg",
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(Icons.share, color: Color(0xFFB5C1D1), size: 19),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.forum_outlined,
                        color: Color(0xFFB5C1D1),
                        size: 19,
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        "2",
                        style: TextStyle(
                          color: Color(0xFFB5C1D1),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Indicadores de página (TRES PUNTOS)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PageDot(isActive: true),
            const SizedBox(width: 6),
            _PageDot(isActive: false),
            const SizedBox(width: 6),
            _PageDot(isActive: false),
          ],
        ),
        const SizedBox(height: 18),
        // --- TAREAS COMPLETADAS ---
        const CompletedTasksSection(),
      ],
    );
  }
}

class _PageDot extends StatelessWidget {
  final bool isActive;
  const _PageDot({required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 16 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFB6D7FF) : Color(0xFFE9F3FF),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

// --- SOLO USAS CustomBottomNavBar --- //
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD5E5FF), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const CustomHeader(),
              const SizedBox(height: 12),
              const PorCompletarSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (idx) => setState(() => selectedIndex = idx),
      ),
    );
  }
}