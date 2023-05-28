import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/ProductModel.dart';

class homeSceen extends StatefulWidget {
  const homeSceen({Key? key}) : super(key: key);

  @override
  State<homeSceen> createState() => _homeSceenState();
}

class _homeSceenState extends State<homeSceen> {
  Future<ProductModel> getApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/e0d96a98-a444-4f0d-8f95-cdbec1e308d4'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<ProductModel>(
                    future: getApi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(snapshot.data!.data![index].shopaddress.toString()),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.3,
                                    width: MediaQuery.of(context).size.width*1,
                                    child:ListView.builder(
                                        itemCount: snapshot.data!.data![index].products!.length,
                                        itemBuilder: (context,position){

                                          return Container(
                                            height: MediaQuery.of(context).size.height*.28,
                                            width: MediaQuery.of(context).size.width*.9,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height*.27,
                                                  width: MediaQuery.of(context).size.width*.8,
                                                  child: ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: snapshot.data!.data![index].products![position].images!.length,
                                                      itemBuilder: (context,number){
                                                        return Column(
                                                          children: [
                                                            Container(
                                                              height: MediaQuery.of(context).size.height*.27,
                                                              width: MediaQuery.of(context).size.width*.8,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit.cover,
                                                                      image: NetworkImage(snapshot.data!.data![index].products![position].images![number].url.toString())
                                                                  )
                                                              ),
                                                              child:Text(snapshot.data!.data![index].products![position].images![number].filename.toString()) ,

                                                            )
                                                          ],
                                                        );


                                                      }),

                                                )
                                              ],
                                            ),

                                          );

                                        }) ,
                                  )
                                ],
                              );
                            });
                        ;
                      } else {
                        return Text('loading');
                      }
                    }))
          ],
        ));
  }
}
