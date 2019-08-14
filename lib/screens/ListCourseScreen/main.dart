import "package:flutter/material.dart";

class ListCourseScreen extends StatelessWidget {
  const ListCourseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          title: Text(
            "Family",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Container(
        child: ListView(
          children: <Widget>[
            Item(title: "Pet", icon: Icons.pets),
            Item(title: "Family", icon: Icons.supervisor_account),
            Item(title: "Flowers", icon: Icons.lock),
            Item(title: "Fruit", icon: Icons.lock),
            Item(title: "Dream", icon: Icons.lock),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key key, this.icon, this.title}) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Please unlock first!'),
    );
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              if (icon == Icons.lock) {
                Scaffold.of(context).showSnackBar(snackBar);
              } else {}
            },
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
            )));
  }
}
