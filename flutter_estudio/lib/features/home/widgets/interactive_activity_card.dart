import 'package:flutter/material.dart';
import 'package:flutter_estudio/features/details/screens/detail_screen.dart';
import 'package:flutter_estudio/features/home/models/activity.dart';

class InteractiveActivityCard extends StatefulWidget {
  final Activity activity;

  const InteractiveActivityCard({
    super.key, 
    required this.activity});

  @override
  State<InteractiveActivityCard> createState() => _InteractiveActivityCardState();
}  
  
class _InteractiveActivityCardState extends State<InteractiveActivityCard>{
   bool isCompleted = false;


  @override
  Widget build(BuildContext context){
    return Card(
      color: isCompleted ? Colors.green.shade100 : Colors.white,
      elevation: 4,
      child: ListTile(
        leading: Icon(widget.activity.icon, size: 40, color:widget.activity.iconColor),
        title: Text(widget.activity.title),
        subtitle: Text(isCompleted ? "Completado" : "Pendiente de completar"),
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(activity: widget.activity,)
            ));
        },
        trailing: IconButton(
          onPressed: (){
            setState(() {
               isCompleted = !isCompleted;
            });
          }, 
          icon: Icon(isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
          )
        ),
      ),
    );
  }
}
  
