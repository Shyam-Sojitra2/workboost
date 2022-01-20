// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workboost/screens/add_availability.dart';
// import 'package:workboost/screens/assignment_list.dart';

// class SignUp2 extends StatelessWidget {
//   var payload = {
//     "payload": {
//       "format": "workboost1",
//       "entity": "employee",
//       "id": " ",
//       "process": "getEmpid",
//       "memberid": 34
//     }
//   };
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: width * .08),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: height * .005),
//             Center(
//               child: Image.asset(
//                 "assets/images/fotu.png",
//                 height: height * .4,
//                 width: width * .8,
//               ),
//             ),
//             Text(
//               'G-VTECH\nWorkboost.\nEmployee',
//               style: TextStyle(
//                   fontSize: height * width * .0001,
//                   fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     height: height * .065,
//                     child: _button(
//                       title: "Sign in with Email",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _button2(
//                   height: height,
//                   title: "Google",
//                 ),
//                 SizedBox(
//                   width: width * .01,
//                 ),
//                 _button2(
//                   height: height,
//                   title: "Apple ID",
//                 )
//               ],
//             ),
//             Center(
//               child: Text(
//                 'By Continuing you agree to the Terms and Conditions',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _button2 extends StatelessWidget {
//   const _button2({Key? key, required this.height, required this.title})
//       : super(key: key);

//   final double height;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SizedBox(
//         height: height * .065,
//         child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               // primary: Colors.black,
//               side: BorderSide(
//                 width: 1.0,
//                 color: Colors.white,
//               ),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(25.0)),
//               ),
//             ),
//             onPressed: () => Get.to(() => AddAvailability()),
//             child: Text(title, style: TextStyle(color: Colors.white))),
//       ),
//     );
//   }
// }

// class _button extends StatelessWidget {
//   const _button({Key? key, required this.title}) : super(key: key);

//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Colors.blue[300],
//           side: BorderSide(
//             width: 1.0,
//             color: Colors.white,
//           ),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(25.0)),
//           ),
//         ),
//         onPressed: () => Get.to(() => AssignmentList(
//               keyval: "4",
//             )),
//         child: Text(title, style: TextStyle(color: Colors.white)));
//   }
// }

// /*........*/

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workboost/controller/Controller.dart';
// import 'package:workboost/screens/add_availability.dart';

// class AssignmentList extends StatelessWidget {
//   AssignmentList({Key? key, required this.keyval}) : super(key: key);
//   final String keyval;
//   var payload;
//   void keyVal() {
//     payload = {
//       "payload": {
//         "format": "workboostinit",
//         "entity": " ",
//         "id": "empid",
//         "process": "INIT",
//         "keyval": keyval
//       }
//     };
//   }

//   Controller controller = Controller();

//   @override
//   Widget build(BuildContext context) {
//     keyVal();
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Assignments",
//         ),
//       ),
//       body: SafeArea(
//         child: FutureBuilder<List>(
//             future: controller.assignments(payload),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data!.isEmpty) {
//                   return Center(
//                     child: Text("No Assignments Available!"),
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data?.length,
//                   itemBuilder: (context, index) => Card(
//                     //  color: Colors.blue[50],
//                     elevation: 8,
//                     margin: EdgeInsets.symmetric(
//                         horizontal: width * .03, vertical: height * .01),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: height * .01, horizontal: width * .035),
//                       leading: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: width * .03,
//                           vertical: height * .01,
//                         ),
//                         child: CircleAvatar(
//                           child: Text(index.toString()),
//                           //backgroundColor: Colors.blue[800],
//                         ),
//                       ),
//                       title: Text(
//                         snapshot.data![index].projname,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         snapshot.data![index].projdescription,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text(snapshot.error.toString()),
//                 );
//               } else {
//                 return Center(
//                   child: Text("Loading....!"),
//                 );
//               }
//             }),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Get.to(() => AddAvailability());
//         },
//         label: Icon(
//           Icons.assignment,
//           color: Colors.redAccent,
//         ),
//         // backgroundColor: Colors.blue[800], //Color(0xFF1EA5FC),
//       ),
//     );
//   }
// }
