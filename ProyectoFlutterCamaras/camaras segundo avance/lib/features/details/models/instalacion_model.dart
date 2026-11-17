class InstalacionModel {
  final int? localId;
  final String clienteNombre;
  final String clienteTelefono;
  final String clienteDireccion;
  final String descripcion;
  final String fecha;
  final double montoCobrado;
  final String estado;

  InstalacionModel({
    this.localId,
    required this.clienteNombre,
    required this.clienteTelefono,
    required this.clienteDireccion,
    required this.descripcion,
    required this.fecha,
    required this.montoCobrado,
    this.estado = 'pendiente',
  });

  Map<String, dynamic> toMap() {
    return {
      'cliente_nombre': clienteNombre,
      'cliente_telefono': clienteTelefono,
      'cliente_direccion': clienteDireccion,
      'descripcion': descripcion,
      'fecha': fecha,
      'monto_cobrado': montoCobrado,
      'estado': estado,
    };
  }

  factory InstalacionModel.fromMap(Map<String, dynamic> map) {
    return InstalacionModel(
      localId: map['id'],
      clienteNombre: map['cliente_nombre'],
      clienteTelefono: map['cliente_telefono'],
      clienteDireccion: map['cliente_direccion'],
      descripcion: map['descripcion'],
      fecha: map['fecha'],
      montoCobrado: map['monto_cobrado'],
      estado: map['estado'],
    );
  }
}