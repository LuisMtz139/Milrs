import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home/home.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_application_1/Pages/botonesBar.dart';

class CompletedTasksSection extends StatelessWidget {
  const CompletedTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        children: [
          // Título y contador
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: const [
                Icon(
                  Icons.expand_more,
                  color: Color.fromARGB(255, 36, 110, 206),
                  size: 22,
                ),
                SizedBox(width: 5),
                Text(
                  "Tareas Completadas",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Color(0xFF212B36),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "2",
                  style: TextStyle(
                    color: Color(0xFF212B36),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          // Lista de tareas completadas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.5),
            child: Column(
              children: const [
                CompletedTaskTile(
                  title:
                      "Agregar los documentos actualizados de la orden de com...",
                  date: "8 abr. 2025",
                  user1: "https://randomuser.me/api/portraits/men/32.jpg",
                  user2: "https://randomuser.me/api/portraits/women/44.jpg",
                ),
                SizedBox(height: 8),
                CompletedTaskTile(
                  title: "Revisión ingeniería TMX_054_2025",
                  date: "28 feb. 2025",
                  user1: "https://randomuser.me/api/portraits/women/44.jpg",
                  user2: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class CompletedTaskTile extends StatelessWidget {
  final String title;
  final String date;
  final String user1;
  final String? user2;

  const CompletedTaskTile({
    super.key,
    required this.title,
    required this.date,
    required this.user1,
    this.user2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(
            color: Color(
              0xFF24D178,
            ), // Verde más brillante, igual a la polimita de tu imagen
            width: 3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded column for title, avatars, and date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF212B36),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Avatares y fecha en la misma línea, avatares primero, fecha a la derecha
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          if (user2 != null)
                            Positioned(
                              left: 18,
                              child: CircleAvatar(
                                radius: 13,
                                backgroundImage: NetworkImage(user2!),
                              ),
                            ),
                          CircleAvatar(
                            radius: 13,
                            backgroundImage: NetworkImage(user1),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF8D97A7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            // Check icono
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF5996FF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.check,
                color: Color.fromARGB(
                  255,
                  240,
                  240,
                  240,
                ), // Verde más brillante
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
