import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
class AddNoteToApi{
  
  Future<void> addNote() async{
try{
  Uri url = Uri.parse('https://appapi.coderangon.com/api/notes/add');
  var body = { "note" : "hello ami masud"};
  var header = { "Accept" : 'applicaton/json'};
  var response = await http.put(url, body: body, headers: header);

  if(response.statusCode == 201){
    EasyLoading.showSuccess("Note Added.");
  }
}
catch(e){
  log("=======Error: $e=====" as num);
}
}

  }
