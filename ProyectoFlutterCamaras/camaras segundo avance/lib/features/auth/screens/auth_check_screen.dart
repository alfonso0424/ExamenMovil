import 'package:camaras/core/storage/local_storage_service.dart';

import 'package:camaras/features/auth/screens/login_screen.dart';
import 'package:camaras/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AuthCheckScreen extends StatefulWidget{

  const AuthCheckScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthCheckScreen();

}

class _AuthCheckScreen extends State <StatefulWidget>{
  final LocalStorageService _storage = LocalStorageService();

  @override
  void initState(){
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async{
    final token = await _storage.getToken();

    if(!mounted) return;

    if(token!= null && token.isNotEmpty)
    {
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } 
    else{
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
  
  @override
  Widget build (BuildContext){
    return Scaffold(
      body: Center(child:
      CircularProgressIndicator(),),

    );
  }

}