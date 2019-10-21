import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.0.107:5000/";

class API{
  static Future getCategoria() async{
    var url = baseUrl + "CategoriaServico/v1/Listar";
    
    return await http.get(
      //url
       Uri.encodeFull(url),
        headers: {"Accept": "application/json"}
      );
  }

  static Future getSubCategoria(String id) async{
    var url = baseUrl + "SubCategoriaServico/v1/CategoriaServico/" + id;
    
    return await http.get(
      //url
       Uri.encodeFull(url),
        headers: {"Accept": "application/json"}
      );
  }
}

