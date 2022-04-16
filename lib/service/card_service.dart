import 'package:bookwalay/model/card_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<CardModel>> getData() async {
  var url = Uri.https('jsonplaceholder.typicode.com', 'photos');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((cardModel) => CardModel.fromJson(cardModel))
        .toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}