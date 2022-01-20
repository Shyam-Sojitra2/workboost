import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/controller/controller.dart';
import 'package:workboost/model/model.dart';
import 'package:workboost/screens/add_availability.dart';
import 'package:workboost/screens/assignment_list.dart';

class SignUp extends StatelessWidget {
  Controller controller = Controller();
  var payload = {
    "payload": {
      "format": "workboost1",
      "entity": "employee",
      "id": " ",
      "process": "getEmpid",
      "memberid": 34
    }
  };
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.blue[100],
            ),
            clipper: CustomClipPath(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .005),
                Center(
                  child: Image.asset(
                    "assets/images/fotu.png",
                    height: height * .4,
                    width: width * .8,
                  ),
                ),
                Text(
                  'G-VTECH\nWorkboost.\nEmployee',
                  style: TextStyle(
                      fontSize: height * width * .0001,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height * .065,
                        child: _button(
                          title: "Sign in with Email",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _button2(
                      height: height,
                      title: "Google",
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    _button2(
                      height: height,
                      title: "Apple ID",
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'By Continuing you agree to the Terms and Conditions',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _button2 extends StatelessWidget {
  const _button2({Key? key, required this.height, required this.title})
      : super(key: key);

  final double height;
  final String title;
  Widget fn() {
    if (title == 'Google') {
      return Image.asset(
        "assets/images/google.png",
        height: 30,
        width: 30,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        "assets/images/apple.png",
        height: 30,
        width: 30,
        fit: BoxFit.fill,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height * .065,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: title == 'Google' ? Colors.white : Colors.black,
              // side: BorderSide(
              //   width: 1.0,
              //   color: title == 'Google' ? Colors.black : Colors.white,
              // ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            onPressed: () => Get.to(() => AddAvailability()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                fn(),
                Text(title,
                    style: TextStyle(
                        color:
                            title == 'Google' ? Colors.black : Colors.white)),
                SizedBox(width: 1),
              ],
            )),
      ),
    );
  }
}

class _button extends StatelessWidget {
  _button({Key? key, required this.title}) : super(key: key);
  Controller controller = Controller();

  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          primary: Colors.blue[300],
          // side: BorderSide(
          //   width: 1.0,
          //   color: Colors.white,
          // ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        onPressed: () {
          controller.login({});
        }, //Get.to(() => AssignmentList(
        //       keyval: "4",
        //     )),
        child: Text(title, style: TextStyle(color: Colors.white)));
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
