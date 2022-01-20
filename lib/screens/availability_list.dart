import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/controller/Controller.dart';
import 'package:workboost/screens/add_availability.dart';

class AvailabilityList extends StatelessWidget {
  AvailabilityList({Key? key, required this.keyval}) : super(key: key);
  final String keyval;
  var payload;
  void keyVal() {
    payload = {
      "payload": {
        "format": "workboost9",
        "entity": "workeravailability",
        "id": "empid",
        "process": "GET1",
        "keyval": keyval
      }
    };
  }

  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    keyVal();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Availables",
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List>(
            future: controller.availabilities(payload),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("Nobody Available!"),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Card(
                    //  color: Colors.blue[50],
                    elevation: 8,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .01),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * .01, horizontal: width * .035),
                      leading: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .03,
                          vertical: height * .01,
                        ),
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
                return Center(
                  child: Text("Loading....!"),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddAvailability());
        },
        label: Icon(
          Icons.assignment,
          color: Colors.redAccent,
        ),
        // backgroundColor: Colors.blue[800], //Color(0xFF1EA5FC),
      ),
    );
  }
}
