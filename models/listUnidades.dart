import 'unidade.dart';

class ListUnidade{

  final List<Unidade> unidades;

  ListUnidade(this.unidades);

  void adicionarUnidade(Unidade unidade){
    unidades.add(unidade);
  }

  void excluiUnidade(int numero){
    unidades.removeWhere((unidade) => unidade.numero == numero);
    if(buscaUnidade(numero))
      print('Falha na exclusão!');
    else
      print('Exclusão bem sucedida!');
  }

   bool buscaUnidade(int numero){
    for(var unidade in unidades){
      if(unidade.numero == numero)
        return true;
    }
    return false;
  }

  factory ListUnidade.fromJson(List<dynamic> parsedJson){
    List<Unidade> unidadesList = new List<Unidade>();
    unidadesList = parsedJson.map((i) => Unidade.fromJson(i)).toList();
    return new ListUnidade(unidadesList);
  }

  Set<List<Unidade>> tojson() => {unidades};
}