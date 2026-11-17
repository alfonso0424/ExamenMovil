import 'package:flutter/material.dart';
import 'package:camaras/features/home/models/activity.dart';

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
      color: Colors.white,
      elevation: 4,
      child: ListTile(
        leading: Icon(widget.activity.icon, size: 40, color:widget.activity.iconColor),
        title: Text(widget.activity.title),
        subtitle: Text(widget.activity.subtitle),
        onTap: widget.activity.destination == null
            ? null
            : () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: widget.activity.destination!,
                ));
              },
      ),
    );
  }
}
  
