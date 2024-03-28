import 'dart:convert';
import 'dart:io';

import 'package:bloclearning/model/api_integration_model.dart';
import 'package:http/http.dart' as http;
class PostReposiotry{
  Future<List<CommentApiModel>> fetchComment() async{
    try { 
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode==200) {
        final body = json.decode(response.body) as List;
        return body.map((e) => CommentApiModel.fromJson(e)).toList();
      }
      return [];
    } on SocketException{
      throw Exception('Error while fatching data');
    }
    catch (e) {
      return [];
    }
  } 
}