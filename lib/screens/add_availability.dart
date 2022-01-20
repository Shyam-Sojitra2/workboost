import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/controller/Controller.dart';
import 'package:workboost/screens/assignment_list.dart';

class AddAvailability extends StatefulWidget {
  @override
  State<AddAvailability> createState() => _AddAvailabilityState();
}

class _AddAvailabilityState extends State<AddAvailability> {
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
          "Add Availability",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDatePick(),
              _buildTimePick("Start", true, startTime, (x) {
                setState(() {
                  startTime = x;
                  print("The picked time is: $x");
                });
              }),
              _buildTimePick("End", true, endTime, (x) {
                setState(() {
                  endTime = x;
                  print("The picked time is: $x");
                });
              }),
              SizedBox(
                height: 25,
              ),
              Card(
                elevation: 8,
                color: Colors.blue[50],
                child: TextFormField(
                  autofocus: false,
                  controller: controller,
                  minLines: 8,
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Note",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 20),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var payload = {
            "payload": {
              "format": "workboost9",
              "entity": "workeravailability",
              "id": "  ",
              "process": "ADD",
              "itemsin": {
                "empid": 4,
                "date": selectedDate.toString(),
                "start": startTime.format(context),
                "end": endTime.format(context),
                "credtedby": 4,
                "modified": null
              }
            }
          };
          var res = await controller2.addAssignment(payload);
          Get.to(() => AssignmentList(
                keyval: "4",
              ));
        },
        label: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[800], //Color(0xFF1EA5FC),
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
        height: height * .1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * .15,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Spacer(),
            Card(
              elevation: 4,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GestureDetector(
                  child: Text(
                    currentTime.format(context),
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onTap: () {
                    selectedTime(
                        context, ifPickedTime, currentTime, onTimePicked);
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
      // elevation: 8,
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
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Spacer(),
            Card(
              elevation: 4,
              color: Colors.white,
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
