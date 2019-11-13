import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class HisAssess extends StatefulWidget {


  @override
  _HisAssessState createState() => _HisAssessState();
}

class _HisAssessState extends State<HisAssess> {

  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;
  FirebaseUser currentUser;
  DatabaseReference watchRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "", "","");
    _initDB();

  }

  void _initDB() async{
    final FirebaseDatabase database = FirebaseDatabase.instance;
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    currentUser = await firebaseAuth.currentUser();
    itemRef = watchRef = database.reference().
    child('ForExpert(Used)').child(currentUser.uid).reference();
    itemRef.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      itemRef.push().set(item.toJson());
    }
  }


  @override
  Widget build(BuildContext context) {
    if (itemRef == null) {
      return Text('ไม่พบข้อมูล....',
        style: TextStyle(fontSize: 40.0, color: Colors.white),);
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('ประวัติแบบประเมินเกรดเนื้อ'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Flexible(
              child: FirebaseAnimatedList(
                query: itemRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.network(items[index].Picture, width: 200.0,
                                height: 150.0,),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(items[index].Date),
                            ],
                          )
                        ],
                      ),
                      ExpansionTile(
                        backgroundColor: Colors.black54,
                        trailing: Icon(Icons.search),
                        title: Text('กดเพื่อดูรายละเอียดการให้เกรด',style: TextStyle(color: Colors.black),),
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  new Text('    รายละเอียด    ',style: TextStyle(fontSize: 16.0),),
                                  new SizedBox(height: 15.0,),
                                  new Text('เกรด'),
                                  new SizedBox(height: 15.0,),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new SizedBox(height: 25.0,),
                                  new Text(items[index].value1),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

class Item {
  String key;
  String Picture;
  String Date;
  String _userId;
  String value1;

  Item(this.Picture, this.Date, this._userId, this.value1);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Picture = snapshot.value["Url_Picture"],
        Date = snapshot.value["Date"],
        _userId = snapshot.value["UID"],
        value1 = snapshot.value["category"];

  toJson() {
    return {
      "Url_Picture": Picture,
      "Date": Date,
      "UID": _userId,
      "category" : value1
    };
  }
}