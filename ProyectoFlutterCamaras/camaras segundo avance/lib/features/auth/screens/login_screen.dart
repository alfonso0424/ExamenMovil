import 'package:camaras/features/auth/services/auth_service.dart';
import 'package:camaras/features/home/screens/home_screen.dart';
import 'package:camaras/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController(text: "emilys");
  final TextEditingController _passwordController = TextEditingController(text: "emilyspass");

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _iniciarSesion() async{
    setState(() {
      _isLoading = true;
    });

    bool success = await _authService.login(_usernameController.text, _passwordController.text);

    if(!mounted)return;

    setState(() {
      _isLoading =false;
    });

    if(success){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inicio de sesion exitoso")));

        Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => MyHomePage()
        ),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inicio de sesion invalido"), backgroundColor: Colors.red,)
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'CamVision',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
              Text(
                'Sistemas de Videovigilancia',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                'Iniciar sesion',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              CustomTextField(controller: _usernameController, label: "usuario"),
              SizedBox(height: 16),
              CustomTextField(controller: _passwordController, label: "contraseña", isPassword: true),
              SizedBox(height: 32),

              _isLoading 
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                onPressed: _iniciarSesion,
                child: Text(
                  "Iniciar sesion",
                  style: TextStyle(fontSize: 18),
                ),
                ),
              SizedBox(height: 16),

              // PPENDIENTE DE IMPLEMENTAR
              TextButton(
                onPressed: () {},
                child: Text("Crear una cuenta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}