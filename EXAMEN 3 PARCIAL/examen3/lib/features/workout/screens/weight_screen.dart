import 'package:examen3/features/workout/models/weight_model.dart';
import 'package:examen3/features/workout/screens/add_weight_screen.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget 
{
  const WeightScreen({super.key});
  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> 
{
  List<WeightModel> registros = [];
  Future<void> _navigateToAddWeight() async {
    final nuevo = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWeightScreen()),
    );

    if (!mounted) return;

    if (nuevo != null && nuevo is WeightModel) {
      setState(() {
        registros.add(nuevo);
      });
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(title: Text('Registro peso'), backgroundColor: Colors.black, foregroundColor: Colors.white,),
      body: registros.isEmpty
          ? Center(child: Text('No hay registros'))
          : ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) 
              {
                final registro = registros[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.fitness_center)),
                    title: Text(
                      registro.fecha,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${registro.pesoKilos} kg'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddWeight,
        child: Icon(Icons.add),
      ),
    );
  }
}