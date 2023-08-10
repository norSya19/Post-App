import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:post_app/post_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListViewPage(),
      
    );
  }
}

class MyListViewPage extends StatefulWidget {
  @override
  _MyListViewPageState createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<MyListViewPage> {
  List<dynamic> _data = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('POST'),
        ),
      ),
      body: _data.isNotEmpty
          ? ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostDetails()),
                    ).then((_) {
                      fetchData();
                    });
                  },
                  //padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[200],
                    child: ListTile(
                      title: Text(
                        '${_data[index]['id']}: ${_data[index]['title']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
