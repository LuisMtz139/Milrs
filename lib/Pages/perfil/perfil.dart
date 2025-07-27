import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/botonesBar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Iconos de notificación y perfil arriba
            Positioned(
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Campana con punto rojo de notificación
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
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Avatar superior derecho
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
            ),
            // Contenido principal
            Column(
              children: [
                const SizedBox(height: 60),
                // Avatar grande con botón de cámara flotante
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF265FE6), width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/68.jpg',
                        ),
                      ),
                    ),
                    // Botón de cámara flotante en la esquina inferior derecha del avatar
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            // Acción de cambiar foto
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x30265FE6),
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: Color(0xFFB6D7FF),
                                width: 1.5,
                              ),
                            ),
                            child: Icon(
                              Icons.photo_camera,
                              color: Color(0xFF265FE6),
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                // Datos del Perfil
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Datos del Perfil',
                          style: TextStyle(
                            color: Color(0xFF265FE6),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Divider(height: 22, color: Color(0xFFE6EAF1)),
                        const SizedBox(height: 6),
                        _LabelField(label: "Nombre *"),
                        _ProfileField(
                          initialValue: 'Amanda Arlet',
                          enabled: false,
                        ),
                        const SizedBox(height: 18),
                        _LabelField(label: "Primer apellido *"),
                        _ProfileField(initialValue: 'Carter', enabled: false),
                        const SizedBox(height: 18),
                        _LabelField(label: "Segundo apellido"),
                        _ProfileField(initialValue: 'Solis', enabled: false),
                        const SizedBox(height: 18),
                        _LabelField(label: "Correo Electrónico *"),
                        _ProfileField(
                          initialValue: 'acarter@gmrobotic.com',
                          enabled: false,
                        ),
                        const SizedBox(height: 17),
                        GestureDetector(
                          onTap: () {
                            // Acción cambiar contraseña
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Contraseña',
                                style: TextStyle(
                                  color: Color(0xFF265FE6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 7),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F9FB),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: ListTile(
                                  dense: true,
                                  leading: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFF265FE6),
                                  ),
                                  title: const Text(
                                    'Cambiar Contraseña',
                                    style: TextStyle(
                                      color: Color(0xFF212B36),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Color(0xFFB5C1D1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 52),
                        // Guardar botón
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2176FF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_circle_outline,
                                size: 20,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Guardar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3, // El índice del perfil
        onTap: (idx) {
          if (idx == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (idx == 1) {
            Navigator.pushReplacementNamed(context, '/tareas');
          } else if (idx == 2) {
            Navigator.pushReplacementNamed(context, '/calendario');
          }
          // El 3 es perfil, así que no hace nada
        },
      ),
    );
  }
}

class _LabelField extends StatelessWidget {
  final String label;
  const _LabelField({required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF8D97A7),
          fontWeight: FontWeight.w500,
          fontSize: 14.7,
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String initialValue;
  final bool enabled;
  const _ProfileField({required this.initialValue, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      readOnly: true,
      style: const TextStyle(
        color: Color(0xFF212B36),
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF8F9FB),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(color: Color(0xFFE6EAF1)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(color: Color(0xFFE6EAF1)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 10,
        ),
      ),
    );
  }
}