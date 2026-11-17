import 'package:camaras/features/details/models/instalacion_model.dart';
import 'package:camaras/features/details/services/local_instalacion_service.dart';
import 'package:flutter/material.dart';

class AgendarScreen extends StatefulWidget 
{
  const AgendarScreen({super.key});

  @override
  State<AgendarScreen> createState() => _AgendarScreenState();
}

class _AgendarScreenState extends State<AgendarScreen> 
{

  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _fechaController = TextEditingController();
  final _montoController = TextEditingController();

  final LocalInstalacionService _service = LocalInstalacionService();

  Future<void> _guardarInstalacion() async 
  {
    if (_formKey.currentState!.validate()) 
    {
      final nuevaInstalacion = InstalacionModel(
        clienteNombre: _nombreController.text,
        clienteTelefono: _telefonoController.text,
        clienteDireccion: _direccionController.text,
        descripcion: _descripcionController.text,
        fecha: _fechaController.text,
        montoCobrado: double.parse(_montoController.text),
      );

      await _service.insertInstalacion(nuevaInstalacion);

      if (!mounted) 
      return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Instalación agendada'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar instalación'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del cliente',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingresa el nombre del cliente';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: _telefonoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingresa el teléfono';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingresa la dirección';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: _descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción del trabajo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) 
                  {
                    return 'Describe el trabajo';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: _fechaController,
                decoration: InputDecoration(
                  labelText: 'Fecha (AAAA-MM-DD)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
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
                controller: _montoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Monto cobrado',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el monto';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Solo se permiten valores numéricos';
                  }
                  return null;
                },
              ),

              Spacer(),
              ElevatedButton(
                onPressed: _guardarInstalacion,
                child: Text('Guardar instalación', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blueAccent,
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