import 'package:flutter/material.dart';
import 'package:optime/components/my_button.dart';
import 'package:optime/components/my_textfield.dart';
import 'package:optime/components/square_tile.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFEF), // Color de fondo similar a la imagen
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Logo y texto de "OPTIME"
                const Text(
                  'OPTIME',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ),

                const Text(
                  '(Crea tu cuenta)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 50),

                // Campo de correo institucional
                MyTextField(
                  controller: emailController,
                  hintText: 'Correo institucional',
                  obscureText: false,
                ),

                const SizedBox(height: 15),

                // Campo de contraseña con icono de visibilidad
                MyTextField(
                  controller: passwordController,
                  hintText: 'Contraseña',
                  obscureText: true,
                  icon: Icons.visibility_off, // Icono de visibilidad
                ),

                const SizedBox(height: 15),

                // Campo de confirmar contraseña con icono de visibilidad
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirmar contraseña',
                  obscureText: true,
                  icon: Icons.visibility_off, // Icono de visibilidad
                ),

                const SizedBox(height: 25),

                // Botón para "Iniciar sesión"
                MyButton(
                  onTap: () => signUserUp(context),
                  buttonText: 'Iniciar sesión',
                ),

                const SizedBox(height: 30),

                // Separador "O continuar con"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'O continuar con',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Botón de Google
                const SquareTile(imagePath: 'lib/images/Google.png'),

                const SizedBox(height: 30),

                // ¿Ya tienes cuenta? Iniciar sesión
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Ya tienes cuenta?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
