import 'package:flutter/material.dart';
import 'package:zen_admin/coinscreen.dart';
import 'package:zen_admin/mainscreen.dart';

class drawr extends StatefulWidget {
  drawr({Key key}) : super(key: key);

  @override
  State<drawr> createState() => _drawrState();
}

class _drawrState extends State<drawr> {
  final Padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          // padding: Padding,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://source.unsplash.com/random/300×150/?game,arcade,animation,landscape'),
                ),
              ),
              padding: EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: NetworkImage(
                          'https://source.unsplash.com/random/300×150/?robot'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Admin User',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Admin@festivo.io',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildMenuItems(
              text: 'Points',
              icon: Icons.score,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(
              height: 10,
            ),
            buildMenuItems(
                text: 'Coins',
                icon: Icons.money,
                onClicked: () => selectedItem(context, 1)),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 2) - 30,
            ),
            const AppDrawerDivider(),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Zen ADMIN',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Version 1.2.5',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AppDrawerDivider(),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Color.fromARGB(255, 0, 0, 0);
    final hoverColor = Color.fromARGB(58, 255, 39, 39);
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Coin()));
        break;
    }
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Color.fromARGB(255, 90, 90, 90),
      indent: 3,
      endIndent: 3,
    );
  }
}
