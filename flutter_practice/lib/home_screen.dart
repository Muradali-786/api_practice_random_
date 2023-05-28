import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/ApiModel.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ApiModel> getApi() async {
    final response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2023-05-27&to=2023-05-27&sortBy=popularity&apiKey=ba84fa5992504440a79d088b64be7ee7'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ApiModel.fromJson(data);
    } else {
      return ApiModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen 1'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder<ApiModel>(
                  future: getApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // outside array
                                  Text(snapshot.data!.status.toString()),
                                  // array object
                                  Text(snapshot.data!.articles![index].title.toString()),
                                  // array sub object
                                  Text(snapshot.data!.articles![index].source!.name.toString()),



                                ],
                              ),
                            );
                          });
                      ;
                    } else {
                      return Text('loading');
                    }
                  }))
        ],
      ),
    );
  }
}
