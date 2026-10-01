import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final Function(bool?) onCompleteChanged;

  const ItemCard({
    required this.item,
    required this.onDelete,
    required this.onTap,
    required this.onCompleteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        onDelete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item.titulo} eliminado correctamente'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: item.completado,
            onChanged: onCompleteChanged,
          ),
          title: Text(
            item.titulo,
          ),
          subtitle: Text(item.categoria),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }
}
