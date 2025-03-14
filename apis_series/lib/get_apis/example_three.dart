import 'dart:convert';

import 'package:apis_series/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Example Three'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ResusableCode(
                                        title: 'Name :',
                                        value: snapshot.data![index].name
                                            .toString()),
                                    ResusableCode(
                                        title: 'Username :',
                                        value: snapshot.data![index].username
                                            .toString()),
                                    ResusableCode(
                                        title: 'Email :',
                                        value: snapshot.data![index].email
                                            .toString()),
                                    ResusableCode(
                                        title: 'Street :',
                                        value: snapshot
                                            .data![index].address!.street
                                            .toString()),
                                    ResusableCode(
                                        title: 'City :',
                                        value: snapshot
                                            .data![index].address!.city
                                            .toString()),
                                    ResusableCode(
                                        title: 'ZipCode :',
                                        value: snapshot
                                            .data![index].address!.zipcode
                                            .toString()),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class ResusableCode extends StatelessWidget {
  String title, value;
  ResusableCode({super.key, required this.title, required this.value}) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
