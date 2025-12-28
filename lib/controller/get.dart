import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/note.dart';


class GetNotesFromApi{

  Future<List<NoteModel>> getData() async{

  try{
    Uri url = Uri.parse('https://appapi.coderangon.com/api/notes');
    var response = await http.get(url);

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body)['notes'];

      List<NoteModel> a = [];

      for(var mapData in jsonData){
        a.add(NoteModel.fromJson(mapData)) ;


      }

      return a;
    }
  }catch(e){
    log("=======Error: $e=====");
  }
  return [];
  }
}




