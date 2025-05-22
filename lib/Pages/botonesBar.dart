import 'package:flutter/material.dart';

// Botón individual
class NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
    super.key,
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
        decoration: selected
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

// Barra de navegación inferior completa
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
          NavItem(
            icon: Icons.home,
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          NavItem(
            icon: Icons.assignment_outlined,
            selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          NavItem(
            icon: Icons.calendar_month_outlined,
            selected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          NavItem(
            icon: Icons.person_outline,
            selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}