import 'dart:io';

class Unidade{
  final int _numero;
  final String _dono;

  Unidade(
    this._numero,
    this._dono
  );

  Unidade.fromJson(Map<String, dynamic> json)
    : _numero = json['numero'],
      _dono = json['dono'];

  Map<String, dynamic> toJson() => {
    'numero': _numero,
    'dono': _dono
  };  

  int get numero => _numero;
  String get dono => _dono; 

  void printData(){
    stdout.write("\n\n$_numero: ");
    stdout.write("$_dono");
  }
}