import 'package:meta/meta.dart';

class Ficha {
  final String documentId;
  final int externalId;
  final String nombre;
  final String direccion;
  final String avatarUrl;
  final List<String> usuariosId;
  final int telefono;
  final bool fonasa;
  final List<String> radiografias;
  final List<String> notas;

  Ficha({
    @required this.documentId,
    @required this.externalId,
    @required this.nombre,
    @required this.direccion,
    @required this.avatarUrl,
    @required this.telefono,
    @required this.usuariosId,
    @required this.fonasa,
    @required this.radiografias,
    @required this.notas
  });
  @override
  String toString() {
    // TODO: implement toString
    return "Ficha $externalId is del paciente $nombre";
  }
}
