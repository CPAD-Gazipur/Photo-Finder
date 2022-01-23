import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GalleryState with ChangeNotifier {
  List<String> titles = [];
  List<String> links = [];
  int selectorIndex = 0;

  void selectIndex(id){
   
    selectorIndex= id;

    notifyListeners();
  }

  void load(String searchKey) async {
    
    links.clear();
    var url = Uri.parse(
        'https://api.pexels.com/v1/search?query=$searchKey&per_page=100');
    var response = await http.get(url,headers: {'Authorization': '563492ad6f9170000100000100aaf35983844698b4687f4b549b1aba'});

    var data = jsonDecode(response.body);
    data = data['photos'];

    for (var item in data) {
      links.add(item['src']['medium']);
    }

    notifyListeners();
  }
}
