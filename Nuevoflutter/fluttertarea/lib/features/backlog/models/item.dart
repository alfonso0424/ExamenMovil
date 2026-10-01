class Item {
  final String id;
  final String titulo;
  final String categoria;
  bool completado;

  Item({
    required this.id,
    required this.titulo,
    required this.categoria,
    this.completado = false,
  });
}
