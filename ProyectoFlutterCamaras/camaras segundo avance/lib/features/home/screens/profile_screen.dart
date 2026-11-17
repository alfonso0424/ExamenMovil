import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Text('Mi Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context), 
              child: Text("volver")
            ),

            CircleAvatar(
              radius: 30,
              child: Icon(Icons.person, size: 30, color: Colors.blue),
            ),

            Text('Juan Pérez'),

            Divider(height: 20, thickness: 1, color: Colors.grey,),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Text('Entrenamientos'),
                        Text('15'),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Text('Pasos Hoy'),
                        Text('8,450'),
                      ],
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