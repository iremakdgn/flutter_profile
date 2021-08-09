import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 25),
                      child: Icon(Icons.person_add_alt_1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0, top: 25),
                      child: Row(
                        children: [
                          Text(
                            "@zarkmuckerberg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Icon(Icons.check_circle)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75.0, top: 25.0),
                      child: Icon(Icons.settings),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/profil.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                RaisedButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Text("+ real name", style: TextStyle(fontSize: 12)),
                ),
                RaisedButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 23.0, right: 23.0),
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Text("+ add bio", style: TextStyle(fontSize: 12)),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text("follower | 286"),
                    SizedBox(
                      width: 100,
                    ),
                    Text("following | 123"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
