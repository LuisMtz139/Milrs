import 'package:flutter/material.dart';

// Barra de navegación personalizada basada en tu diseño
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 56),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFD5E5FF),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavItem(
            icon: Icons.assignment_outlined,
            selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _NavItem(
            icon: Icons.calendar_month_outlined,
            selected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _NavItem(
            icon: Icons.person_outline,
            selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFF265FE6);
    const Color inactiveColor = Color(0xFF265FE6);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration:
            selected
                ? BoxDecoration(color: activeColor, shape: BoxShape.circle)
                : const BoxDecoration(),
        child: Icon(
          icon,
          color: selected ? Colors.white : inactiveColor,
          size: 28,
        ),
      ),
    );
  }
}

// Header: Campana arriba, luego "Hola Amanda!" y "Tienes 3..." debajo, ambos movidos a la derecha
class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Columna izquierda: Campana, saludo y subtítulo debajo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Icon(
                      Icons.notifications_none,
                      color: Color(0xFF265FE6),
                      size: 28,
                    ),
                  ),
                  Positioned(
                    top: 7,
                    right: 6,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Color(0xFFF76C6C),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Movemos el texto a la derecha usando un Padding
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ), // Ajusta este valor para mover más/menos a la derecha
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hola Amanda!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Color(0xFF4377BD),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Tienes 3 tareas sin completar',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Espaciador
          const Spacer(),
          // Perfil con borde y progreso circular alineados arriba a la derecha
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF265FE6), width: 2.4),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 21,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/68.jpg',
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.6,
                  strokeWidth: 4,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFDBD4A)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Vista principal
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
              // ... tu contenido ...
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
