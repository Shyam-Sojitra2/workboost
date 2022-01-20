import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/controller/Controller.dart';
import 'package:workboost/screens/assignment_list.dart';

class AddAssignment extends StatefulWidget {
  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  final controller = TextEditingController();
  Controller controller2 = Controller();
  Color blu = Color(0xFFBBDEFBFF);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          "Add Assignment",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .06, vertical: height * .05),
            child: SizedBox(
              height: height * .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  _buildDatePick(),
                  Row(
                    children: [
                      _buildTimePick("Start", true, startTime, (x) {
                        setState(() {
                          startTime = x;
                          print("The picked time is: $x");
                        });
                      }),
                      Spacer(),
                      _buildTimePick("End", true, endTime, (x) {
                        setState(() {
                          endTime = x;
                          print("The picked time is: $x");
                        });
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blue[50],
                          child: TextField(
                            autofocus: false,
                            controller: controller,
                            // minLines: 8,
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Team Leader",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 16),
                              // border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blue[50],
                          child: TextField(
                            autofocus: false,
                            controller: controller,
                            // minLines: 8,
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Location",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 16),
                              // border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 8,
                    color: Colors.blue[50],
                    child: TextFormField(
                      autofocus: false,
                      controller: controller,
                      minLines: 3,
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Vendor Contact Info",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 18),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var payload = {
            "payload": {
              "format": "workboost5",
              "entity": "projects",
              "id": "  ",
              "process": "ADD",
              "itemsin": {
                "empid": 4,
                "date": selectedDate.toString(),
                "start": startTime.format(context),
                "end": endTime.format(context),
                "credtedby": 4,
                "modified": null,
                "location": "up",
                "teamlead": "ss",
                "vendor": "sumit",
                "projname": "uu"
              }
            }
          };
          var payload2 = {
            "payload": {
              "format": "workboost5",
              "entity": "projects",
              "id": "  ",
              "process": "ADD",
              "itemsin": {
                "idprojects": 8,
                "projname": "proj",
                "coid": 4,
                "createdby": 4,
                "location": "kuba",
                "vendor": 4,
                "creation date": selectedDate.toString(),
                "updated date": selectedDate.toString(),
                "projdescription": "good one",
                "contractid": "222"
              }
            }
          };
          var res = await controller2.addAssignment(payload2);
          Get.to(() => AssignmentList(
                keyval: "4",
              ));
        },
        label: Icon(
          Icons.add_task_sharp,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[300], //Color(0xFF1EA5FC),
      ),
    );
  }

  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var _pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (_pickedTime != null) {
      onTimePicked(_pickedTime);
    }
  }

  Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8,
      color: Colors.blue[50],
      child: SizedBox(
        height: height * .07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * .04,
            ),
            SizedBox(
              width: 40,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            //Spacer(),
            Card(
              elevation: 1,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GestureDetector(
                  child: Text(
                    currentTime.format(context),
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  onTap: () {
                    selectedTime(
                        context, ifPickedTime, currentTime, onTimePicked);
                  },
                ),
              ),
            ),
            SizedBox(
              width: width * .02,
            ),
          ],
        ),
      ),
    );
  }

  Future _selectDate(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _buildDatePick() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8,
      // color: Colors.blue[50],
      child: SizedBox(
        height: height * .1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width * .15,
            ),
            Text(
              "Date",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              width: 20,
            ),
            Card(
              elevation: 1,
              color: Colors.blue[50],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GestureDetector(
                  child: Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
            ),
            SizedBox(
              width: width * .1,
            ),
          ],
        ),
      ),
    );
  }
}
