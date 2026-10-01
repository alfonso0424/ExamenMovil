import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/item_card.dart';
import '../widgets/add_item_dialog.dart';

class BacklogScreen extends StatefulWidget {
  const BacklogScreen({super.key});

  @override
  State<BacklogScreen> createState() => _BacklogScreenState();
}

class _BacklogScreenState extends State<BacklogScreen> {
  List<Item> items = [];

  void _addItem(String titulo, String categoria) {
    setState(() {
      items.add(
        Item(
          id: DateTime.now().toString(),
          titulo: titulo,
          categoria: categoria,
        ),
      );
    });
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _toggleComplete(int index, bool? value) {
    setState(() {
      items[index].completado = value ?? false;
    });
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(onAdd: _addItem),
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Text('Backlog Tracker'),
      ),
      body: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  item: items[index],
                  onDelete: () => _deleteItem(index),
                  onTap: () {
                    //aqui no supe que agregar en el push, o a que ventana dirigir
                  },
                  onCompleteChanged: (value) =>
                      _toggleComplete(index, value),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
