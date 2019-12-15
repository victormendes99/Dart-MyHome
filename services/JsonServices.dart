import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/listUnidades.dart';
import '../models/unidade.dart';

class JsonService{
  
  static Future<String> carregarJson() async{
    return await new File('./jsonUnidades.json').readAsString();
  }



  void cadastrarUnidade(Unidade unidade) async{
  print(Process.runSync("clear", [], runInShell: true).stdout);
  ListUnidade lista = await getUnidadesJson();
  lista.adicionarUnidade(unidade);
  if(lista.buscaUnidade(unidade.numero))
    print('Unidade incluída com sucesso!');
  else
    print('Falha ao adicionar unidade!');
  await atualizarJson(lista);  
  }

void excluirUnidade(int numero) async{
  print(Process.runSync("clear", [], runInShell: true).stdout);
  ListUnidade lista =  await getUnidadesJson();
  lista.excluiUnidade(numero);
  var str = json.encode(lista.unidades);
  File file = new File('./jsonUnidades.json');
  file.writeAsString(str);
  sleep(const Duration(seconds:3));
}


static Future<ListUnidade> getUnidadesJson() async{
  String teste = await carregarJson();
  final jsonResponse = json.decode(teste);
  ListUnidade unidades = new ListUnidade.fromJson(jsonResponse);
  return unidades;
}

void atualizarJson(ListUnidade lista){
  var str = json.encode(lista.unidades);
  File file =  new File('./jsonUnidades.json');
  try{
    file.writeAsString(str);
  }
  catch(ex){
    print("Falha ao escrever no Json.");
  }
}

}
