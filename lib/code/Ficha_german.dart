

class Ficha{
  String paciente;
  String tratamiento;

  Ficha(String paciente, String tratamiento){
    this.paciente = paciente;
    this.tratamiento = tratamiento;
  }

  String getPaciente(){
    return this.paciente;
  }
  
  @override
  String toString() {
      // TODO: implement toString
      return this.paciente+': '+this.tratamiento;
    }
}