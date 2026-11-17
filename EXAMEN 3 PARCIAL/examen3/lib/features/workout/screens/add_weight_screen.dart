import 'package:examen3/features/workout/models/weight_model.dart';
import 'package:flutter/material.dart';

class AddWeightScreen extends StatefulWidget 
{
  const AddWeightScreen({super.key});
  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> 
{
  final _formKey = GlobalKey<FormState>();
  final _fechaController = TextEditingController();
  final _pesoController = TextEditingController();

  void _saveWeight() 
  {
    if (_formKey.currentState!.validate()) 
    {
      final newWeight = WeightModel(
        fecha: _fechaController.text,
        pesoKilos: double.parse(_pesoController.text),
      );

      Navigator.pop(context, newWeight);
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo registro de peso'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ TextFormField(
                controller: _fechaController,
                decoration: InputDecoration( labelText: 'Fecha', border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) 
                  {
                    return 'Ingresa la fecha';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso enkg',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) 
                  {
                    return 'Ingresa el peso';
                  }
                  final peso = double.tryParse(value);
                  if (peso == null) {
                    return 'Solo se permiten valores numéricos';
                  }
                  if (peso < 1) {
                    return 'El peso debe ser mayor a 0';
                  }
                  return null;
                },
              ),

              Spacer(),
              ElevatedButton(
                onPressed: _saveWeight,
                child: Text('Guardar', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}