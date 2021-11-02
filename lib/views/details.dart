import 'package:flutter/material.dart';
import 'package:shopping_app/model/list_item_response.dart';
import 'package:shopping_app/services/api_service.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<ListItemResponse>>(
          future: ApiService().getShoppingListData(),
          builder: (context, snap) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(snap.data.single.image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    title: Text(
                      snap.data.single.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    subtitle: Text(
                      snap.data.single.description,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
