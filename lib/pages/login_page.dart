import 'package:flutter/material.dart';
import 'package:optime/components/my_button.dart';
import 'package:optime/components/my_textfield.dart';
import 'package:optime/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) {
    Navigator.pushNamed(context, '/Home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              const Text(
                '¡BIENVENIDO!',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: emailController,
                hintText: 'Correo',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Color.fromARGB(255, 54, 54, 54)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              MyButton(
                onTap: () => signUserIn(context),
              ),

              const SizedBox(height: 50),

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'O continuar con',
                        style: TextStyle(color: Colors.grey[800]),
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

              const SizedBox(height: 50),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/Google.png'),
                ],
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes cuenta?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 4),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Register');
                    },
                    child: const Text(
                      'Registrate ahora',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
