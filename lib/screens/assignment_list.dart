import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/controller/Controller.dart';
import 'package:workboost/screens/add_availability.dart';

class AssignmentList extends StatelessWidget {
  AssignmentList({Key? key, required this.keyval}) : super(key: key);
  final String keyval;
  var payload;
  void keyVal() {
    payload = {
      "payload": {
        "format": "workboostinit",
        "entity": " ",
        "id": "empid",
        "process": "INIT",
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
          "Assignments",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.blue[100],
                  ),
                  clipper: CustomClipPath(),
                ),
                Spacer(),
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.blue[100],
                  ),
                  clipper: CustomClipPath2(),
                ),
              ],
            ),
            FutureBuilder<List>(
                future: controller.assignments(payload),
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
                            snapshot.data![index].projname,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            snapshot.data![index].projdescription,
                            style: TextStyle(fontWeight: FontWeight.bold),
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
          ],
        ),
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

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    //path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    path.arcToPoint(Offset(size.width, 0),
        clockwise: false, radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
