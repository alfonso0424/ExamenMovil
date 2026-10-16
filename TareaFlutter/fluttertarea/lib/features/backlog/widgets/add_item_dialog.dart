import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  final Function(String, String) onAdd;

  AddItemDialog({required this.onAdd});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  late TextEditingController _titleController;
  String _selectedCategory = 'PC';
  
  final List<String> categories = ['PC', 'Consola', 'Móvil'];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar nuevo ítem'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Título del ítem',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          DropdownButton<String>(
            value: _selectedCategory,
            isExpanded: true,
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              widget.onAdd(_titleController.text, _selectedCategory);
              Navigator.pop(context);
            }
          },
          child: Text('Agregar'),
        ),
      ],
    );
  }
}
