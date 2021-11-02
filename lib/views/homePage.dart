import 'package:flutter/material.dart';
import 'package:shopping_app/model/list_item_response.dart';
import 'package:shopping_app/services/api_service.dart';
import 'package:shopping_app/views/details.dart';
import 'package:shopping_app/views/favourite_screen.dart';
import 'package:shopping_app/views/profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> favList = [];
  var catBarTitles = [
    'electronic',
    'jewellery',
    "men's clothing",
    "women's clothing",
    'Others',
  ];
  var catBarIcons = [
    Icons.local_drink,
    Icons.bolt,
    Icons.house,
    Icons.bolt,
    Icons.double_arrow,
  ];
  Widget catBar(int index) {
    return Container(
      height: 60,
      width: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.8)),
          ]),
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(
          catBarIcons[index],
          color: Colors.green,
        ),
        title: Text(
          catBarTitles[index],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          toolbarHeight: 60,
          title: Row(
            children: [
              Text(
                "Flutter ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color(0xff41e069),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "Shopping",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ],
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black, size: 30),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cellularnews.com/wp-content/uploads/2020/03/black-and-red-light-dark-figures-325x485.jpg'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 85.0),
                  child: Text(
                    "Welcome To App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  tileColor: Colors.grey[100],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                  tileColor: Colors.grey[100],
                ),
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("Cart",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                  tileColor: Colors.grey[100],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favourite()));
                },
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favourites",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                  tileColor: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<ListItemResponse>>(
          future: ApiService().getShoppingListData(),
          builder: (childcontext, snap) => (snap.connectionState ==
                  ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: catBarTitles.length,
                          itemBuilder: (context, int index) {
                            return catBar(index);
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snap.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details()));
                            },
                            child: Container(
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Login or SignUp First"),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                            size: 30,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Login or SignUp First"),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.black,
                                            size: 30,
                                          )),
                                    ],
                                  ),
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snap.data[i].image),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ListTile(
                                    title: Text(
                                      snap.data[i].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    subtitle: Text(
                                      snap.data[i].description,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ));
  }
}
