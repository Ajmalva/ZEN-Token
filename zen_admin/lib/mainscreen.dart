import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import 'package:zen_admin/coinscreen.dart';
import 'package:zen_admin/drawr.dart';
import 'package:zen_admin/pay.dart';

//mainpage type
class Home extends StatefulWidget {
  var rt = false;
  Home({this.rt});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int ent1, ent2, ent3, ent4, ent5, ent6, ent7, xtr;
  int ppnt = 0;
  var items = [
    'event1',
    'event2',
    'event3',
    'event4',
    'event5',
    'event6',
    'event7',
    'others',
  ];
  String result = "";
  int pnt;
  String id;

  Future _scanQR() async {
    try {
      String cameraScanResult = await scanner.scan();
      setState(() {
        result =
            cameraScanResult; // setting string result with cameraScanResult
      });
    } on PlatformException catch (e) {
      //print(e);
    }
  }

  String myName;

  TextEditingController nameController = TextEditingController();
  String fullName = '';

  String dropdownvalue = 'event1';

  // String selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZEN ADMIN'),
        backgroundColor: Colors.redAccent,
      ),

      drawer: drawr(),
      // drawer: Drawer(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             fit: BoxFit.fill,
      //             image: NetworkImage(
      //                 'https://source.unsplash.com/random/300×150/?game,arcade,animation,landscape'),
      //           ),
      //         ),
      //         padding: EdgeInsets.all(0),
      //         child: Container(
      //           child: Column(
      //             children: [
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               CircleAvatar(
      //                 radius: 42,
      //                 backgroundImage: NetworkImage(
      //                     'https://source.unsplash.com/random/300×150/?robot'),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Text(
      //                 'Admin User',
      //                 style: TextStyle(
      //                   fontSize: 15,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.w400,
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Text(
      //                 'Admin@festivo.io',
      //                 style: TextStyle(
      //                   fontSize: 10,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.w400,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: ListView(
      //           padding: EdgeInsets.zero,
      //           children: [
      //             AppDrawerTile(
      //                 index: 0,
      //                 onTap: () {
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder: (context) => Home()));
      //                 }),
      //             AppDrawerTile(
      //                 index: 1,
      //                 onTap: () {
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder: (context) => Coin()));
      //                 }),
      //             // AppDrawerTile(
      //             //   index: 2,
      //             //   // onTap: updateState(2),
      //             // ),
      //             // AppDrawerTile(
      //             //   index: 3,
      //             //   // onTap: updateState(3),
      //             // ),
      //             // AppDrawerTile(
      //             //   index: 4,
      //             //   // onTap: updateState(4),
      //             // ),
      //             // AppDrawerTile(
      //             //   index: 5,
      //             //   // onTap: updateState(5),
      //             // ),
      //             Spacer(),
      //             // SizedBox(
      //             //   height: MediaQuery.of(context).size.height / 2,
      //             // ),
      //             const AppDrawerDivider(),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             Center(
      //               child: Text(
      //                 'Zen Wallet',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w500,
      //                   fontStyle: FontStyle.italic,
      //                   fontSize: 20,
      //                   color: Defaults.drawerItemSelectedColor,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //             Center(
      //               child: Text(
      //                 'Version 1.2.5',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w500,
      //                   fontStyle: FontStyle.italic,
      //                   fontSize: 12,
      //                   color: Defaults.drawerItemColor,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             const AppDrawerDivider(),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          // width: double.infinity,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  //color: Colors.deepPurple,
                  gradient: const LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.orangeAccent,
                        Colors.red,
                        Colors.redAccent
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, //begin of the gradient color
                      end: Alignment.bottomRight, //end of the gradient color
                      stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                      //set the stops number equal to numbers of color
                      ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 109, 102, 102)
                          .withOpacity(0.6),
                      spreadRadius: 8,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // height: 300,
                      child: Container(
                        child: Column(
                          children: [
                            ClipPath(
                              // clipper: AvatarClipper(),
                              child: Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  // gradient: LinearGradient(
                                  //     colors: [
                                  //       Colors.orange,
                                  //       Colors.orangeAccent,
                                  //       Colors.red,
                                  //       Colors.redAccent
                                  //       //add more colors for gradient
                                  //     ],
                                  //     begin: Alignment
                                  //         .topLeft, //begin of the gradient color
                                  //     end: Alignment
                                  //         .bottomRight, //end of the gradient color
                                  //     stops: [
                                  //       0,
                                  //       0.2,
                                  //       0.5,
                                  //       0.8
                                  //     ] //stops for individual color
                                  //     //set the stops number equal to numbers of color
                                  //     ),
                                  //color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://source.unsplash.com/random/300×150/?game,arcade,animation,landscape'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              // left: 80,
                              // top: 85,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Credit Points",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(height: 10),
                                  FutureBuilder(
                                    future: _fetch(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return TextField(
                                          controller: TextEditingController(
                                            text: 'USER',
                                          ),
                                          enabled: false,
                                          decoration: InputDecoration(
                                            disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            labelText: 'User ID',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }
                                      return TextField(
                                        controller:
                                            TextEditingController(text: myName),
                                        enabled: false,
                                        decoration: InputDecoration(
                                          disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          labelText: 'User ID',
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  FutureBuilder(
                                    future: _fetch(),
                                    builder: (context, snapshot) {
                                      if (xtr == null ||
                                          ent1 == null ||
                                          ent2 == null ||
                                          ent3 == null ||
                                          ent4 == null ||
                                          ent5 == null ||
                                          ent6 == null ||
                                          ent7 == null) {
                                        ppnt = 0;
                                      } else {
                                        ppnt = xtr +
                                            ent1 +
                                            ent2 +
                                            ent3 +
                                            ent4 +
                                            ent5 +
                                            ent6 +
                                            ent7;
                                      }
                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return TextField(
                                          controller: TextEditingController(
                                              text: 'POINTS'),
                                          enabled: false,
                                          decoration: InputDecoration(
                                            disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            labelText: 'Currrent Points',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }
                                      return TextField(
                                        controller: TextEditingController(
                                            text: ppnt.toString()),
                                        enabled: false,
                                        decoration: InputDecoration(
                                          disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          labelText: 'Currrent Points',
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                  // TextField(
                                  //   controller: TextEditingController(
                                  //       //text: result

                                  //       ),
                                  //   enabled: false,
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(25))),
                                  //     labelText: 'User ID',
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Game',
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)))),
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownvalue = newValue;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        labelText: 'Points',
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Enter the new Point'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        //fullName = text;
                                        //you can access nameController in its scope to get
                                        // the value of text entered as shown below
                                        fullName = nameController.text;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  // Text(fullName),
                                  // Text(dropdownvalue)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(color: Colors.blue),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            onPressed: () => {_scanQR()},
                            icon: const Icon(
                              Icons.qr_code_scanner_rounded,
                              size: 50,
                            ),
                            label: const Text(
                              'SCAN',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(color: Colors.blue),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            onPressed: () => {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => PayScreen()),
                              // ),
                              pnt = int.parse(fullName),
                              id = result,
                              Pay().payServer(
                                context,
                                pnt,
                                id,
                                dropdownvalue,
                              ),
                              if (widget.rt == true)
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Successfully Updated The Points"),
                                    ),
                                  ),
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Error: Failed to Updated The Points"),
                                    ),
                                  ),
                                }
                            },
                            icon: const Icon(
                              Icons.send,
                              size: 50,
                            ),
                            label: const Text(
                              'SEND',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 50,
                      //   child: const VerticalDivider(
                      //     color: Color.fromARGB(255, 0, 0, 0),
                      //   ),
                      // ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //);
    );
  }

  TextStyle buildMontserrat(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: 18,
      color: color,
      fontWeight: fontWeight,
    );
  }

  _fetch() async {
    // final firebaseUser = await FirebaseAuth.instance.currentUser;
    // if (firebaseUser != null)
    await FirebaseFirestore.instance
        .collection('users')
        .doc(result)
        .get()
        .then((ds) async {
      myName = ds.data()['name'];
      ent1 = ds.data()['event1'];
      ent2 = ds.data()['event2'];
      ent3 = ds.data()['event3'];
      ent4 = ds.data()['event4'];
      ent5 = ds.data()['event5'];
      ent6 = ds.data()['event6'];
      ent7 = ds.data()['event7'];
      xtr = ds.data()['others'];
      // print(myName);
      // print(myPoints);
    }).catchError((e) {
      // print(e);
    });
  }
}

// class AvatarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     return Path()
//       ..lineTo(0, size.height)
//       ..lineTo(8, size.height)
//       ..arcToPoint(Offset(114, size.height), radius: const Radius.circular(1))
//       ..lineTo(size.width, size.height)
//       ..lineTo(size.width, 0)
//       ..close();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.deepPurple,
//       automaticallyImplyLeading: false,
//       actions: [
//         FlatButton.icon(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => MainScreen()));
//             },
//             icon: Icon(
//               Icons.person_outline,
//               color: Colors.white,
//             ),
//             label: Text(
//               'Log out',
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//             ))
//       ],
//     ),
//     body: Center(
//       child: FutureBuilder(
//         future: _fetch(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState != ConnectionState.done)
//             return Text("Loading data...Please wait");
//           return Text("Email : $myEmail");
//         },
//       ),
//     ),
//   );
// }

// _fetch() async {
//   final firebaseUser = await FirebaseAuth.instance.currentUser!;
//   if (firebaseUser != null)
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(firebaseUser.uid)
//         .get()
//         .then((ds) async {
//       myEmail = ds.data()!['email'];
//       myCoins = ds.data()!['coins'];
//       print(myEmail);
//       print(myCoins);
//     }).catchError((e) {
//       print(e);
//     });
// }

// class AppDrawerDivider extends StatelessWidget {
//   const AppDrawerDivider({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Divider(
//       height: 1,
//       thickness: 1,
//       color: Defaults.drawerItemColor,
//       indent: 3,
//       endIndent: 3,
//     );
//   }
// }

// class AppDrawerTile extends StatelessWidget {
//   const AppDrawerTile({
//     Key key,
//     @required this.index,
//     @required this.onTap,
//   }) : super(key: key);

//   final int index;
//   final Function onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: ListTile(
//         onTap: onTap,
//         // selected: indexClicked == index,
//         selectedTileColor: Defaults.drawerSelectedTileColor,
//         // leading: Icon(
//         //   Defaults.drawerItemIcon[index],
//         //   size: 35,
//         //   // color: indexClicked == index
//         //       ? Defaults.drawerItemSelectedColor
//         //       : Defaults.drawerItemColor,
//         // ),
//         title: Text(
//           Defaults.drawerItemText[index],
//           // style: GoogleFonts.sanchez(
//           //   fontSize: 20,
//           //   fontWeight: FontWeight.w500,
//           //   // color: indexClicked == index
//           //       ? Defaults.drawerItemSelectedColor
//           //       : Defaults.drawerItemColor,
//           // ),
//         ),
//       ),
//     );
//   }

