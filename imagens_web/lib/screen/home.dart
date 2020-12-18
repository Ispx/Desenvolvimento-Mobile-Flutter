import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<dynamic>> getHttp() async {
    List<dynamic> list = List();
    String _url = "https://picsum.photos/v2/list";
    Response response = await http.get(_url);
    var data = json.decode(response.body);
    list.addAll(data);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<List<dynamic>>(
        future: getHttp(),
        builder: (context, snapshot) {
          List<dynamic> listData = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              return Center(
                child: Text("None"),
              );
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              return ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Autor: " + listData[index]['author'],
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white),
                          ),
                          Image.network(listData[index]['download_url']),
                        ],
                      ),
                    );
                  });
              break;
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
