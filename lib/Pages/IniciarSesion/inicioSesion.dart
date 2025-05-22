import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/IniciarSesion/modalRecuperarContrasena.dart';
import 'package:flutter_application_1/Pages/home/home.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4BA3FD), // Azul clarito arriba
              Color(0xFF9EC7FC), // Azul claro centro
              Color(0xFFE8EDF4), // Azul muy claro abajo
              Color(0xFFFFFFFF), // Blanco puro al final
            ],
            stops: [
              0.0, // #4BA3FD - top
              0.48, // #9EC7FC - 48%
              0.85, // #E8EDF4 - 85%
              1.0, // #FFFFFF - bottom
            ],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: isLargeScreen ? 80 : 60,
                  left: 24,
                  right: 24,
                  bottom: 0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50), // Espacio arriba
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assets/AppTareas.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4BA3FD), // Azul clarito
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ingresa usando tu usuario y contraseña',
                      style: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.25,
                            ), // Muy translúcido
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Usuario",
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.person_outline,
                                    color: Color(0xFF4BA3FD),
                                  ),
                                  hintText: 'Ingresa tu nombre de usuario',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFB0B7C3),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Contraseña",
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFF4BA3FD),
                                  ),
                                  hintText: 'Ingresa tu contraseña',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFB0B7C3),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility_outlined,
                                    color: Color(0xFFB0B7C3),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 44,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF4BA3FD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  const DashboardView(),
                                        ),
                                      ),
                                  child: const Text(
                                    'Iniciar Sesión',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      barrierColor: Colors.black.withOpacity(
                                        0.18,
                                      ),
                                      backgroundColor: Colors.transparent,
                                      builder:
                                          (context) =>
                                              const RecuperarContrasenaModal(),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(0, 0),
                                  ),
                                  child: const Text(
                                    'Olvidaste la contraseña',
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 130,
              child: Center(
                child: SizedBox(
                  height: 36,
                  child: Image.asset('assets/gm.png', fit: BoxFit.contain),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
