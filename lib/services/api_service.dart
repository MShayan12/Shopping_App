import 'package:dio/dio.dart';
import 'package:shopping_app/model/list_item_response.dart';

class ApiService {
  static Dio _client;
  ApiService() {
    if (_client == null) {
      _client = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/products"));
    }
  }
  Future<List<ListItemResponse>> getShoppingListData() async {
    var response = await _client.get('');
    return ListItemResponse.fromJsonList(response.data);
  }
}

















// // ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, void_checks, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unused_import, avoid_print

// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Api extends StatefulWidget {
//   @override
//   _ApiState createState() => _ApiState();
// }

// class _ApiState extends State<Api> {
//   var allproduct = [];

//   Future getproducts() async {
//     var response =
//         await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     var jsondata = jsonDecode(response.body);

//     for (var i in jsondata) {
//       productModel getdata = productModel(
//           title: i['title'],
//           price: i['price'],
//           description: i['description'],
//           category: i['category'],
//           image: i['image'],
//           rating: i['rating']['count']);
//       allproduct.add(getdata);
//     }
//     return allproduct;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getproducts(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//             children: [
//               Expanded(
//                   child: ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, i) {
//                         return Container(
//                           padding: EdgeInsets.all(6),
//                           margin: EdgeInsets.all(12),
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             snapshot.data[i].image))),
//                                 child: Column(
//                                   children: [],
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       }))
//             ],
//           );
//         } else
//           return Container(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//       },
//     );
//   }
// }

// class productModel {
//   var title;
//   var price;
//   var description;
//   var category;
//   var image;
//   var rating;

//   productModel(
//       {this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image,
//       this.rating});
// }
