import 'package:flutter/material.dart';

import 'componentUi/dropdown.dart';
import 'model/dropdownModel.dart';
import 'model/familytree.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  DropDownObj valueDropdown;

  @override
  void initState() {
    super.initState();
    parrentName = '';
  }

  String currentName = '';
  String parrentName = '';
  String grandParrent = '';
  String childrenName = '';
  String parrentCode = '';

  @override
  Widget build(BuildContext context) {
    List<String> code = [];

    return Scaffold(
        appBar: AppBar(
          title: Text('Family Tree'),
        ),
        body: Column(
          children: [
            createDropDown(
              label: 'Choose Family',
              optionItems: personList
                  .map((x) => DropdownMenuItem<DropDownObj>(
                      value: DropDownObj(id: x.personID, descs: x.name),
                      child: Text(x.name)))
                  .toList(),
              selectedValue: valueDropdown ?? null,
              onChangeFunc: (value) {
                currentName = value.descs;

                for (int x = 0; x < personList.length; x++) {
                  if (personList[x].personID == value.id) {
                    parrentCode = personList[x].parent;
                    if (parrentCode != '') {
                      for (int y = 0; y < personList.length; y++) {
                        if (personList[y].marry == parrentCode) {
                          code.add(personList[y].name);
                        }
                      }
                      parrentName = code.join(',');
                    } else {
                      code.clear();
                      parrentName = '-';
                    }
                  }
                }

                setState(() {});
              },
            ),
            Text('Name : ' + currentName ?? ''),
            Text('Parent : ' + parrentName ?? '-'),
          ],
        ));
  }
}
