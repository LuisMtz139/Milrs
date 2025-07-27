import 'package:flutter/material.dart';

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            _CompletedTaskCard(
              label: "Tarea",
              labelColor: Color(0xFFE4FAF6),
              labelTextColor: Color(0xFF36C6B0),
              title: "Agregar los documentos actualizados de la orden de compra 125639",
              status: "Completado",
              statusColor: Color(0xFF28B869),
              dueDate: "8 abr. 2025",
              people: [
                'https://randomuser.me/api/portraits/men/31.jpg',
                'https://randomuser.me/api/portraits/women/68.jpg',
              ],
              comments: 4,
              actions: 0,
            ),
            const SizedBox(height: 16),
            _CompletedTaskCard(
              label: "Oficio",
              labelColor: Color(0xFFE2EDFF),
              labelTextColor: Color(0xFF3B7BFF),
              title: "Revisión ingeniería TMX_054_2025",
              status: "Completado",
              statusColor: Color(0xFF28B869),
              dueDate: "28 feb. 2025",
              people: [
                'https://randomuser.me/api/portraits/women/68.jpg',
              ],
              comments: 3,
              actions: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class _CompletedTaskCard extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color labelTextColor;
  final String title;
  final String status;
  final Color statusColor;
  final String dueDate;
  final List<String> people;
  final int actions;
  final int comments;

  const _CompletedTaskCard({
    required this.label,
    required this.labelColor,
    required this.labelTextColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.dueDate,
    required this.people,
    required this.actions,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 410),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        decoration: BoxDecoration(
          color: Color(0xFFF8FAFD),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFEAF0F7), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Etiqueta y menú
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
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
                Icon(Icons.more_vert, color: Color(0xFFB6B8C7), size: 21),
              ],
            ),
            const SizedBox(height: 7),
            // Título
            Text(
              title,
              style: const TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF373A42),
              ),
            ),
            const SizedBox(height: 12),
            // Estado, fecha y avatares
            Row(
              children: [
                Icon(Icons.check_circle, color: statusColor, size: 18),
                const SizedBox(width: 5),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  dueDate,
                  style: const TextStyle(
                    color: Color(0xFFB0B6C5),
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 14),
                // Avatares
                ...people
                    .map((url) => Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundImage: NetworkImage(url),
                          ),
                        )),
                const Spacer(),
                // Acciones y comentarios
                if (actions > 0) ...[
                  Icon(Icons.device_hub_outlined, size: 19, color: Color(0xFF8266FF)),
                  const SizedBox(width: 2),
                  Text(
                    '$actions',
                    style: const TextStyle(
                      color: Color(0xFF8266FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 9),
                ],
                Icon(Icons.forum_outlined, size: 19, color: Color(0xFFB3B8D8)),
                const SizedBox(width: 2),
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