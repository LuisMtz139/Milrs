import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/botonesBar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime selectedDate = DateTime(2025, 4, 8);
  bool isMonthlyView = true; // Por defecto vista mensual
  int? expandedDay; // Día expandido para mostrar actividades

  // Ejemplo de actividades por día
  final Map<int, List<Map<String, dynamic>>> dayTasks = {
    5: [
      {
        'title': "Revisión de avances del proyecto",
        'date': "5 abr. 2025",
        'people': [
          'https://randomuser.me/api/portraits/women/44.jpg',
          'https://randomuser.me/api/portraits/men/23.jpg',
        ],
        'completed': false,
      }
    ],
    6: [
      {
        'title': "Enviar reporte semanal",
        'date': "6 abr. 2025",
        'people': [
          'https://randomuser.me/api/portraits/women/68.jpg',
        ],
        'completed': false,
      }
    ],
    7: [
      {
        'title': "Reunión con proveedor",
        'date': "7 abr. 2025",
        'people': [
          'https://randomuser.me/api/portraits/men/31.jpg',
        ],
        'completed': false,
      }
    ],
    8: [
      {
        'title': "Agregar los documentos actualizados de la orden de compra 125639",
        'date': "28 feb. 2025",
        'people': [
          'https://randomuser.me/api/portraits/men/31.jpg',
          'https://randomuser.me/api/portraits/women/68.jpg',
        ],
        'completed': true,
      }
    ],
    9: [
      {
        'title': "Entregar presentación al cliente",
        'date': "9 abr. 2025",
        'people': [
          'https://randomuser.me/api/portraits/men/44.jpg',
        ],
        'completed': false,
      }
    ],
    10: [
      {
        'title': "Capacitación interna",
        'date': "10 abr. 2025",
        'people': [
          'https://randomuser.me/api/portraits/women/44.jpg',
          'https://randomuser.me/api/portraits/men/23.jpg',
        ],
        'completed': false,
      }
    ],
    11: [
      {
        'title': "Verificar inventario",
        'date': "11 abr. 2025",
        'people': [
          'https://randomuser.me/api/portraits/women/68.jpg',
        ],
        'completed': false,
      }
    ],
    12: [
      {
        'title': "Corrección de la ingeniería TMX_054_2025",
        'date': "28 feb. 2025",
        'people': [
          'https://randomuser.me/api/portraits/men/31.jpg',
          'https://randomuser.me/api/portraits/women/68.jpg',
          'https://randomuser.me/api/portraits/men/44.jpg',
        ],
        'completed': false,
        'morePeople': 3,
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    String monthYear = "Abril, 2025";
    final accentColor = Color(0xFF265FE6);
    final purpleColor = Color(0xFFB3B8D8);

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
                              color: accentColor,
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
                            color: accentColor,
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
                // Barra Mes y Botón de cambio de vista
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined, color: accentColor, size: 22),
                      const SizedBox(width: 10),
                      Text(
                        monthYear,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFF373A42),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: isMonthlyView ? purpleColor : accentColor,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            isMonthlyView = !isMonthlyView;
                            expandedDay = null;
                          });
                        },
                        tooltip: "Cambiar vista de calendario",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Calendario
                if (isMonthlyView)
                  _MonthlyCalendar(
                    selectedDate: selectedDate,
                    onChange: (date) {
                      setState(() {
                        selectedDate = date;
                        expandedDay = null;
                      });
                    },
                  )
                else
                  _CalendarWeekSelector(
                    selectedDay: selectedDate.day,
                    onDaySelected: (day) {
                      setState(() {
                        selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
                        expandedDay = null;
                      });
                    },
                  ),
                const SizedBox(height: 8),
                // Lista de días
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    children: [
                      for (var day = 5; day <= 12; day++)
                        _CalendarDayRow(
                          dayName: _getDayName(day),
                          tasks: dayTasks[day] ?? [],
                          onAdd: () {
                            if ((dayTasks[day] ?? []).isNotEmpty) {
                              setState(() {
                                expandedDay = expandedDay == day ? null : day;
                              });
                            }
                          },
                          expanded: expandedDay == day,
                        ),
                    ],
                  ),
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
                  color: purpleColor,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              right: 32,
              bottom: 32,
              child: FloatingActionButton(
                heroTag: "add",
                backgroundColor: purpleColor,
                elevation: 3,
                onPressed: () {},
                child: Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (idx) {
          if (idx == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (idx == 1) {
            Navigator.pushReplacementNamed(context, '/tareas');
          } else if (idx == 3) {
            Navigator.pushReplacementNamed(context, '/perfil');
          }
        },
      ),
    );
  }

  String _getDayName(int day) {
    const weekdayNames = [
      'Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vier', 'Sab'
    ];
    DateTime date = DateTime(2025, 4, day);
    return "${weekdayNames[date.weekday % 7]} $day abril";
  }
}

// Selector semanal
class _CalendarWeekSelector extends StatelessWidget {
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const _CalendarWeekSelector({
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final days = [
      {'label': 'Do', 'day': 5},
      {'label': 'Lu', 'day': 6},
      {'label': 'Ma', 'day': 7},
      {'label': 'Mi', 'day': 8},
      {'label': 'Ju', 'day': 9},
      {'label': 'Vi', 'day': 10},
      {'label': 'Sa', 'day': 11},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: days.map((d) {
          final isSelected = d['day'] == selectedDay;
          return Expanded(
            child: GestureDetector(
              onTap: () => onDaySelected(d['day'] as int),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Color(0xFF265FE6),
                        borderRadius: BorderRadius.circular(8),
                      )
                    : null,
                child: Column(
                  children: [
                    Text(
                      d['label'] as String,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFFB3B8D8),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      (d['day'] as int).toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFF373A42),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Calendario mensual simple
class _MonthlyCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChange;

  const _MonthlyCalendar({
    required this.selectedDate,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final firstDayOfWeek = DateTime(2025, 4, 1).weekday;
    final daysInMonth = 30;
    List<Widget> rows = [];

    List<Widget> week = [];
    int dayNum = 1;
    // Primer semana
    for (int i = 1; i < firstDayOfWeek; i++) {
      week.add(Expanded(child: Container()));
    }
    for (int i = firstDayOfWeek; i <= 7; i++) {
      week.add(_CalendarDayButton(
        day: dayNum,
        selected: dayNum == selectedDate.day,
        onTap: () => onChange(DateTime(2025, 4, dayNum)),
      ));
      dayNum++;
    }
    rows.add(Row(children: week));
    // Siguientes semanas
    while (dayNum <= daysInMonth) {
      week = [];
      for (int i = 0; i < 7; i++) {
        if (dayNum > daysInMonth) {
          week.add(Expanded(child: Container()));
        } else {
          week.add(_CalendarDayButton(
            day: dayNum,
            selected: dayNum == selectedDate.day,
            onTap: () => onChange(DateTime(2025, 4, dayNum)),
          ));
          dayNum++;
        }
      }
      rows.add(Row(children: week));
    }

    final weekLabels = ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: weekLabels
                .map((label) => Expanded(
                      child: Center(
                        child: Text(
                          label,
                          style: TextStyle(
                            color: Color(0xFFB3B8D8),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 4),
          ...rows.map((r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.5),
                child: r,
              )),
        ],
      ),
    );
  }
}

class _CalendarDayButton extends StatelessWidget {
  final int day;
  final bool selected;
  final VoidCallback onTap;

  const _CalendarDayButton({
    required this.day,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: selected
              ? BoxDecoration(
                  color: Color(0xFF265FE6),
                  shape: BoxShape.circle,
                )
              : null,
          child: Center(
            child: Text(
              '$day',
              style: TextStyle(
                color: selected ? Colors.white : Color(0xFF373A42),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CalendarDayRow extends StatelessWidget {
  final String dayName;
  final List<Map<String, dynamic>> tasks;
  final VoidCallback onAdd;
  final bool expanded;

  const _CalendarDayRow({
    required this.dayName,
    required this.tasks,
    required this.onAdd,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasTasks = tasks.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  dayName,
                  style: TextStyle(
                    color: Color(0xFFB3B8D8),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle, color: Color(0xFF265FE6), size: 28),
                onPressed: hasTasks ? onAdd : null,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),
          if (expanded)
            ...tasks.map((task) => _CalendarTaskCard(
                  title: task['title'],
                  date: task['date'],
                  people: (task['people'] as List<String>),
                  completed: task['completed'],
                  morePeople: task['morePeople'],
                )),
        ],
      ),
    );
  }
}

class _CalendarTaskCard extends StatelessWidget {
  final String title;
  final String date;
  final List<String> people;
  final int? morePeople;
  final bool completed;

  const _CalendarTaskCard({
    required this.title,
    required this.date,
    required this.people,
    this.morePeople,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: completed ? Color(0xFF38B48C) : Color(0xFFE6EAF1),
          width: 1.4,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 42,
            decoration: BoxDecoration(
              color: Color(0xFF38B48C),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF373A42),
                    fontWeight: FontWeight.w500,
                    fontSize: 15.2,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    ...people
                        .take(3)
                        .map(
                          (url) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                              radius: 11,
                              backgroundImage: NetworkImage(url),
                            ),
                          ),
                        ),
                    if (morePeople != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 22,
                          height: 22,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDF1F7),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '+$morePeople',
                            style: const TextStyle(
                              color: Color(0xFF7B8699),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: TextStyle(
                        color: Color(0xFFB3B8D8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            completed ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
            color: completed ? Color(0xFF38B48C) : Color(0xFFB3B8D8),
            size: 22,
          )
        ],
      ),
    );
  }
}