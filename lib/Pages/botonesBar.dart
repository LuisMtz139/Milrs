import 'package:flutter/material.dart';

// --- Barra de navegación personalizada ---
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
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 38,
      ), // <-- AJUSTA AQUÍ (antes era 24)
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

// --- Pantalla principal ---
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
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.blue[300],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hola Amanda!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFF4377BD),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Tienes 3 tareas sin completar',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                value: 0.6,
                                backgroundColor: Colors.grey,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFFDBD4A),
                                ),
                                strokeWidth: 4,
                              ),
                            ),
                            const Text(
                              '60%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color(0xFFFDBD4A),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Aquí va el resto de tu contenido...
              const Spacer(),
            ],
          ),
        ),
      ),
      // Menú de navegación fijo y más arriba
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (idx) => setState(() => selectedIndex = idx),
      ),
    );
  }
}

class CompletedTaskTile extends StatelessWidget {
  final String title;
  final String date;
  final String avatar;

  const CompletedTaskTile({
    super.key,
    required this.title,
    required this.date,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF2AC4A5), width: 2),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        subtitle: Row(
          children: [
            ClipOval(
              child: Image.asset(
                avatar,
                width: 22,
                height: 22,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const Spacer(),
            const Icon(Icons.check_circle, color: Color(0xFF2AC4A5), size: 20),
          ],
        ),
      ),
    );
  }
}
