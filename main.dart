import 'dart:async';
import 'dart:io';
import 'controller/ServiceController.dart';
void main(){
  
  imprimirMenu();
  var escolha = stdin.readLineSync();
  processaOperacao(escolha);
}

void imprimirMenu(){
  print("1. Digite 0 para sair");
  print("1. Digite 1 para cadastrar nova unidade");
  print("2. Digite 2 para excluir uma unidade");
  print("3. Digite 3 para listar unidades cadastradas");
}

Future<int> processaOperacao(var escolha) async{
  while(escolha != 0){
  switch (escolha) {
    case '0':
      print("Volte sempre!");
      return 0;
    case '1':
      await ServiceController().novaUnidade();
      break;
    case '2':
      await ServiceController().excluirUnidade();
      break;
    case '3':
    await ServiceController().listaUnidades();
    break;    
    default:
      return 0;
      
  }
  imprimirMenu();
  escolha = stdin.readLineSync();
  }
  return 0;
}



