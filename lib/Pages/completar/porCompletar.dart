import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/botonesBar.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  int selectedTab = 0;

  // Keys para medir el ancho de los tabs
  final List<GlobalKey> tabKeys = [GlobalKey(), GlobalKey()];
  double _indicatorLeft = 0;
  double _indicatorWidth = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _setIndicator());
    super.initState();
  }

  void _setIndicator() {
    final RenderBox? renderBox =
        tabKeys[selectedTab].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _indicatorLeft =
            renderBox
                .localToGlobal(
                  Offset.zero,
                  ancestor: context.findRenderObject(),
                )
                .dx -
            (context.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero)
                .dx;
        _indicatorWidth = renderBox.size.width;
      });
    }
  }

  void _onTabTap(int idx) {
    setState(() {
      selectedTab = idx;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _setIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // TopBar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Notificaciones
                      Stack(
                        clipBehavior: Clip.none,
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
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Avatar usuario
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF265FE6),
                            width: 2.4,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 21,
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/women/68.jpg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // --- Tabs ---
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 2),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _TabItem(
                            key: tabKeys[0],
                            title: "Por completar",
                            selected: selectedTab == 0,
                            showRedDot: selectedTab == 0,
                            icon: Icons.schedule_outlined,
                            onTap: () => _onTabTap(0),
                          ),
                          const SizedBox(width: 32),
                          _TabItem(
                            key: tabKeys[1],
                            title: "Completadas",
                            selected: selectedTab == 1,
                            showRedDot: false,
                            icon: Icons.check_circle_outline,
                            onTap: () => _onTabTap(1),
                          ),
                        ],
                      ),
                      // Indicador azul animado
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 240),
                        curve: Curves.ease,
                        left: _indicatorLeft,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 240),
                          width: _indicatorWidth,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Color(0xFF265FE6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // --- Lista de tareas (cards) ---
                Expanded(
                  child:
                      selectedTab == 0
                          ? _buildPendingTasks()
                          : _buildCompletedTasks(),
                ),
              ],
            ),
            // --- Floating buttons ---
            Positioned(
              left: 32,
              bottom: 32,
              child: FloatingActionButton(
                heroTag: "filter",
                backgroundColor: Colors.white,
                elevation: 3,
                onPressed: () {},
                child: Icon(
                  Icons.groups_2_outlined,
                  color: Color(0xFFB3B8D8),
                  size: 30,
                ),
              ),
            ),
            Positioned(
              right: 32,
              bottom: 32,
              child: FloatingActionButton(
                heroTag: "add",
                backgroundColor: Color(0xFFB3B8D8),
                elevation: 3,
                onPressed: () {},
                child: Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (idx) {
          if (idx == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (idx == 2) {
            Navigator.pushReplacementNamed(context, '/calendario');
          } else if (idx == 3) {
            Navigator.pushReplacementNamed(context, '/perfil');
          }
        },
      ),
    );
  }

  Widget _buildPendingTasks() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      children: [
        _TaskCard(
          label: "Tarea",
          labelColor: Color(0xFFB3E7DC),
          title:
              "Descargar el último formato subido en la sección de documentos preliminares nom TMX_054_2025-23",
          status: "Atrasada",
          statusColor: Color(0xFFF7665E),
          dueDate: "4 mar. 2025",
          people: [
            'https://randomuser.me/api/portraits/men/31.jpg',
            'https://randomuser.me/api/portraits/women/68.jpg',
            'https://randomuser.me/api/portraits/men/44.jpg',
          ],
          morePeople: null,
          comments: 4,
          actions: 2,
          labelTextColor: Color(0xFF38B48C),
        ),
        const SizedBox(height: 16),
        _TaskCard(
          label: "Oficio",
          labelColor: Color(0xFFD2E1F8),
          title: "Revisar la primer página del documento de correcciones",
          status: "Pendiente",
          statusColor: Color(0xFFF8B84E),
          dueDate: "19 mar. 2025",
          people: ['https://randomuser.me/api/portraits/women/68.jpg'],
          morePeople: null,
          comments: 3,
          actions: 2,
          labelTextColor: Color(0xFF265FE6),
        ),
        const SizedBox(height: 16),
        _TaskCard(
          label: "Tarea",
          labelColor: Color(0xFFB3E7DC),
          title: "Corrección de la ingeniería TMX_054_2025",
          status: "Pendiente",
          statusColor: Color(0xFFF8B84E),
          dueDate: "12 abr. 2025",
          people: [
            'https://randomuser.me/api/portraits/men/31.jpg',
            'https://randomuser.me/api/portraits/women/68.jpg',
            'https://randomuser.me/api/portraits/men/44.jpg',
          ],
          morePeople: 3,
          comments: 3,
          actions: 2,
          labelTextColor: Color(0xFF38B48C),
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildCompletedTasks() {
    // Basado en la imagen proporcionada por el usuario
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      children: [
        _TaskCardCompleted(
          label: "Tarea",
          labelColor: Color(0xFFB3E7DC),
          title:
              "Agregar los documentos actualizados de la orden de compra 125639",
          status: "Completado",
          statusColor: Color(0xFF38B48C),
          dueDate: "8 abr. 2025",
          people: [
            'https://randomuser.me/api/portraits/men/31.jpg',
            'https://randomuser.me/api/portraits/women/68.jpg',
          ],
          comments: 4,
          actions: 0,
          labelTextColor: Color(0xFF38B48C),
        ),
        const SizedBox(height: 16),
        _TaskCardCompleted(
          label: "Oficio",
          labelColor: Color(0xFFD2E1F8),
          title: "Revisión ingeniería TMX_054_2025",
          status: "Completado",
          statusColor: Color(0xFF38B48C),
          dueDate: "28 feb. 2025",
          people: [
            'https://randomuser.me/api/portraits/women/68.jpg',
            'https://randomuser.me/api/portraits/men/31.jpg',
          ],
          comments: 3,
          actions: 1,
          labelTextColor: Color(0xFF265FE6),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;
  final bool showRedDot;
  final IconData icon;
  final VoidCallback onTap;

  const _TabItem({
    Key? key,
    required this.title,
    required this.selected,
    required this.showRedDot,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = selected ? Color(0xFF265FE6) : Color(0xFFB3B8D8);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            if (showRedDot)
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 2),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Card para tareas pendientes (igual que antes)
class _TaskCard extends StatelessWidget {
  final String label;
  final Color labelColor;
  final String title;
  final String status;
  final Color statusColor;
  final String dueDate;
  final List<String> people;
  final int? morePeople;
  final int actions;
  final int comments;
  final Color labelTextColor;
  const _TaskCard({
    required this.label,
    required this.labelColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.dueDate,
    required this.people,
    this.morePeople,
    required this.actions,
    required this.comments,
    required this.labelTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 410),
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
        decoration: BoxDecoration(
          color: Color(0xFFF8FBFF),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Color(0xFFE6EAF1), width: 1.4),
          boxShadow: [
            BoxShadow(
              color: Color(0x0A265FE6),
              blurRadius: 8,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Etiqueta y menú
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: labelColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: labelTextColor,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(Icons.more_horiz, color: Color(0xFFAAB6C7), size: 22),
              ],
            ),
            const SizedBox(height: 7),
            // Título
            Text(
              title,
              style: const TextStyle(
                fontSize: 15.2,
                fontWeight: FontWeight.w500,
                color: Color(0xFF373A42),
              ),
            ),
            const SizedBox(height: 10),
            // Estado y fecha
            Row(
              children: [
                Icon(
                  status == "Atrasada"
                      ? Icons.error_outline
                      : Icons.watch_later_outlined,
                  color: statusColor,
                  size: 17,
                ),
                const SizedBox(width: 4),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 13),
                Text(
                  dueDate,
                  style: const TextStyle(
                    color: Color(0xFF8D97A7),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Avatares y acciones
            Row(
              children: [
                // Avatares
                ...people
                    .take(3)
                    .map(
                      (url) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage: NetworkImage(url),
                        ),
                      ),
                    ),
                if (morePeople != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF1F7),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '+$morePeople',
                        style: const TextStyle(
                          color: Color(0xFF7B8699),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
                Icon(Icons.repeat_outlined, size: 18, color: Color(0xFFB3B8D8)),
                const SizedBox(width: 4),
                Text(
                  '$actions',
                  style: const TextStyle(
                    color: Color(0xFFB3B8D8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 15),
                Icon(Icons.forum_outlined, size: 18, color: Color(0xFFB3B8D8)),
                const SizedBox(width: 4),
                Text(
                  '$comments',
                  style: const TextStyle(
                    color: Color(0xFFB3B8D8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Card para tareas completadas (diferentes íconos y color para completado)
class _TaskCardCompleted extends StatelessWidget {
  final String label;
  final Color labelColor;
  final String title;
  final String status;
  final Color statusColor;
  final String dueDate;
  final List<String> people;
  final int actions;
  final int comments;
  final Color labelTextColor;
  const _TaskCardCompleted({
    required this.label,
    required this.labelColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.dueDate,
    required this.people,
    required this.actions,
    required this.comments,
    required this.labelTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 410),
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
        decoration: BoxDecoration(
          color: Color(0xFFF8FBFF),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Color(0xFFE6EAF1), width: 1.4),
          boxShadow: [
            BoxShadow(
              color: Color(0x0A265FE6),
              blurRadius: 8,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Etiqueta y menú
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: labelColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: labelTextColor,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(Icons.more_horiz, color: Color(0xFFAAB6C7), size: 22),
              ],
            ),
            const SizedBox(height: 7),
            // Título
            Text(
              title,
              style: const TextStyle(
                fontSize: 15.2,
                fontWeight: FontWeight.w500,
                color: Color(0xFF373A42),
              ),
            ),
            const SizedBox(height: 10),
            // Estado y fecha
            Row(
              children: [
                Icon(Icons.check_circle_outline, color: statusColor, size: 17),
                const SizedBox(width: 4),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 13),
                Text(
                  dueDate,
                  style: const TextStyle(
                    color: Color(0xFF8D97A7),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Avatares y acciones
            Row(
              children: [
                ...people
                    .take(3)
                    .map(
                      (url) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage: NetworkImage(url),
                        ),
                      ),
                    ),
                const Spacer(),
                Icon(Icons.repeat_outlined, size: 18, color: Color(0xFFB3B8D8)),
                const SizedBox(width: 4),
                Text(
                  '$actions',
                  style: const TextStyle(
                    color: Color(0xFFB3B8D8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 15),
                Icon(Icons.forum_outlined, size: 18, color: Color(0xFFB3B8D8)),
                const SizedBox(width: 4),
                Text(
                  '$comments',
                  style: const TextStyle(
                    color: Color(0xFFB3B8D8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
