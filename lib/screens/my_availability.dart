import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/controller/Controller.dart';
import 'package:workboost/screens/add_availability.dart';

class MyAvailability extends StatelessWidget {
  var payload = {
    "payload": {
      "format": "workboost9",
      "entity": "workeravailability",
      "id": "idworkeravail",
      "process": "GET1",
      "keyval": "3"
    }
  };
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assignments",
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List>(
            future: controller.availabilities(payload),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("No Assignments Available!"),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Card(
                    //  color: Colors.blue[50],
                    elevation: 8,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      leading: Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
                        child: CircleAvatar(
                          child: Text(index.toString()),
                          //backgroundColor: Colors.blue[800],
                        ),
                      ),
                      title: Text(
                        snapshot.data![index].date,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            snapshot.data![index].start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            snapshot.data![index].end,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Container();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddAvailability());
        },
        label: Icon(
          Icons.assignment,
          color: Colors.white,
        ),
      ),
    );
  }
}
