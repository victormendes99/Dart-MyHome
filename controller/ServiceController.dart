import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/unidade.dart';
import '../models/listUnidades.dart';
import '../services/JsonServices.dart';

class ServiceController{

  void novaUnidade(){

    int numero;
    String dono;
    print(Process.runSync("clear", [], runInShell: true).stdout);
    print("Informe o número da nova unidade:");
    numero = int.parse(stdin.readLineSync());
    print("Informe o dono da unidade:");
    dono = stdin.readLineSync();
    Unidade unidade = new Unidade(numero, dono);
    new JsonService().cadastrarUnidade(unidade);
}

void excluirUnidade(){
  int numero;
  print(Process.runSync("clear", [], runInShell: true).stdout);
  print("Informe o número da unidade a ser excluída:");
  numero = int.parse(stdin.readLineSync());
  new JsonService().excluirUnidade(numero);
}

  void listaUnidades() async{
    ListUnidade unidadeslist = await getListUnidades();
    unidadeslist.unidades.forEach((result) => result.printData());
    print('\n');
  }

  Future<ListUnidade> getListUnidades() async{
    Future<ListUnidade> listUnidades = JsonService.getUnidadesJson();
    ListUnidade unidadesLi;
    await listUnidades.then((result) => unidadesLi = new ListUnidade(result.unidades));
    return unidadesLi;
  }
}