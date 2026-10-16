import 'package:flutter/material.dart';
import 'package:flutter_estudio/features/home/models/activity.dart';
import 'package:flutter_estudio/features/home/screens/profile_screen.dart';
import 'package:flutter_estudio/features/home/widgets/interactive_activity_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activity> activityList = [

    Activity(title: "Mi Hola", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Pasos diarios", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Box", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Mi Widget", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Pasos diarios", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Box", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Mi Widget", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Pasos diarios", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Box", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Mi Widget", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Pasos diarios", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Box", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Mi Widget", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Pasos diarios", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Box", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Mi Widget", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Pasos diarios", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
    Activity(title: "Box", subtitle: "", trailingText: "trailingText", icon: Icons.abc, iconColor: Colors.black ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Text('Panel de actividad fisica'),
        actions: [                    
        IconButton(              
          icon: Icon(Icons.person),
          onPressed: () {          
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
  ],
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
        // Column(
        //   children: [
        //     Text("Resumen de hoy", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        //     Card(
        //       child: ListTile(
        //         leading: Icon(Icons.directions_walk),
        //         title: Text("Pasos diarios"),
        //         subtitle: Text("Meta 10 000 pasos"),
        //         trailing: Text("7,450", style: TextStyle(fontSize: 18),),
        //       ),
        //     ),
        //     ActivityCard(
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //     InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //     InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //     InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //                 InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //                 InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //                 InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //                 InteractiveActivityCard(              
        //       title: "Mi Widget", 
        //       subtitle: "", 
        //       trailingText: "trailingText", 
        //       icon: Icons.abc, 
        //       iconColor: Colors.black 
        //     ),
        //   ],
        // ),
         ),
      );
  }
}



