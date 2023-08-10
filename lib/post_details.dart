import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PostDetails extends StatefulWidget {
  @override
  _PostDetailsPageState createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetails> {
  //final dynamic _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text('POST DETAILS'),
        ),
      ),


      /*body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
            //padding: const EdgeInsets.all(8.0),
            return Card(
              //padding: const EdgeInsets.all(8.0),
              color: Colors.grey[200],
              child: ListTile(
                title: Text(
                  '${_data[index]['body']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          );
        },
      ),*/
    );
  }
}
