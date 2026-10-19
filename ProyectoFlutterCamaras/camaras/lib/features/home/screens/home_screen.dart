import 'package:flutter/material.dart';
import 'package:camaras/features/home/models/activity.dart';
import 'package:camaras/features/home/widgets/interactive_activity_card.dart';
import 'package:camaras/features/details/screens/detail_agendar.dart';
import 'package:camaras/features/details/screens/detail_finanzas.dart';
import 'package:camaras/features/details/screens/detail_historial.dart';
import 'package:camaras/features/details/screens/detail_inventario.dart';
import 'package:camaras/features/details/screens/detail_registrar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activity> activityList = [

    Activity(title: "Agendar nueva instalación", subtitle: "Recuerda revisar horarios disponibles", trailingText: "", icon: Icons.calendar_month, iconColor: Colors.black, destination: (context) => const AgendarScreen() ),
    Activity(title: "Inventario", subtitle: "", trailingText: "", icon: Icons.inventory_2, iconColor: Colors.black, destination: (context) => const InventarioScreen() ),
    Activity(title: "Registrar intalación", subtitle: "Recuerda tomar fotos", trailingText: "", icon: Icons.engineering, iconColor: Colors.black, destination: (context) => const RegistrarScreen() ),
    Activity(title: "Finanzas", subtitle: "Historial de gastos y ingresos", trailingText: "", icon: Icons.trending_up, iconColor: Colors.black, destination: (context) => const FinanzasScreen() ),
    Activity(title: "Historial de intalaciones", subtitle: "", trailingText: "", icon: Icons.history, iconColor: Colors.black, destination: (context) => const HistorialScreen() ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text(
          'CamSec',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: 
      Padding(
        padding:EdgeInsets.all(16.0),
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: activityList.length,
          itemBuilder: (context, index){
            final currentActivity = activityList[index];

            return InteractiveActivityCard(activity: currentActivity,);

          }
          )
         ),
      );
  }
}



