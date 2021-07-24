import 'package:flutter/material.dart';

import 'model/familytree.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Person> personList = [
    Person(
        personID: '001',
        name: "William",
        marry: 'M001',
        parent: '',
        gender: "Male"),
    Person(
        personID: '002',
        name: "Jessica",
        marry: 'M001',
        parent: '',
        gender: "Female"),
    Person(
        personID: '003',
        name: "Samantha",
        marry: 'M002',
        parent: 'M001',
        gender: "Female"),
    Person(
        personID: 'X003',
        name: "Maya",
        marry: 'M002',
        parent: '',
        gender: "Female"),
    Person(
        personID: 'Y003',
        name: "Yukio",
        marry: '',
        parent: 'M002',
        gender: "Female"),
    Person(
        personID: '004',
        name: "Soleil",
        marry: 'M003',
        parent: 'M001',
        gender: "Female"),
    Person(
        personID: 'X004',
        name: "Richard",
        marry: 'M003',
        parent: '',
        gender: "Female"),
    Person(
        personID: '005',
        name: "Ryan",
        marry: 'M003',
        parent: '',
        gender: "Male"),
  ];

  List<String> child = ['1', '2'];

  List<Marry> marry = [Marry('M001', 'C001'), Marry('M002', 'C0002')];

  List<Child> children = [
    Child('C001', 3, ['0003,0004, 0005'])
  ];

  @override
  void initState() {
    super.initState();
    sort();
  }

  String sorts;

  sort() {
    for (int y = 0; y < personList.length; y++) {
      name.add(personList[y].name);
    }
    if (name.length == personList.length) {
      name.sort((a, b) => a.compareTo(b));
      sorts = 'Sort by Ascending';
    }
  }

  String currentName = '';
  String parrentName = '';
  String grandParrent = '';
  String childrenName = '';
  String parrentCode = '';

  TextEditingController _textController = TextEditingController();

  Widget searchBox() {
    return Container(
      height: 45,
      padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: _textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          filled: true,
          fillColor: Colors.blue,
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: 'Search',
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.none,
            ),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (String text) {
          if (text.length > 2) {
            for (int x = 0; x < name.length; x++) {
              if (name[x].contains((new RegExp(text, caseSensitive: false)))) {
                print(name[x]);
                name = [name[x]];
                setState(() {});
              }
            }
          }

          if (text.length < 2) {
            name.clear();
            sort();
            setState(() {});
          }
        },
        onFieldSubmitted: (String text) async {},
      ),
    );
  }

  List<String> name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search and Sort'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBox(),
            InkWell(
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Icon(
                        Icons.sort_rounded,
                        size: 50,
                      )),
                  Text('Click This to Sort')
                ],
              ),
              onTap: () {
                if (sorts == 'Sort by Descending') {
                  sorts = 'Sort by Ascending';

                  name.sort((a, b) => a.compareTo(b));

                  setState(() {});
                } else {
                  name.sort((b, a) => a.compareTo(b));
                  sorts = 'Sort by Descending';
                  setState(() {});
                }
              },
            ),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  sorts,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Text(name[index]);
                  }),
            ),
          ],
        ));
  }
}
