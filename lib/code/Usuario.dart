import 'package:proyectoprograufro/code/Ficha.dart';

class Usuario{

  List<Ficha> fichas = new List(10);

  Usuario();

  addFicha(Ficha newFicha){
    this.fichas.add(newFicha);
  }

  Ficha getFicha(int index){
    return this.fichas[index-1];
  }
}