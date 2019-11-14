import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:omg/Setup/HisAssess.dart';
import 'package:omg/Setup/HistoryAnalysis.dart';
import 'package:omg/Setup/Location.dart';
import 'package:omg/Setup/SignIn.dart';
import 'package:omg/Setup/analysis.dart';
import 'package:omg/Setup/assessment.dart';

class LOL extends StatelessWidget {
  const LOL({
    Key key,
    @required this.user
  }) : super(key: key);
  final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBE4D6),
      appBar: new AppBar(
        backgroundColor: Color(0xFFEBE4D6),
        title: new Center(child: new Text('${user.email}',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
      ),
      body: new ListView(children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Function1(teks: "แบบประเมินเกรดเนื้อ"),
                Function2(teks: "วิเคราะห์เกรดเนื้อ"),
              ],),
            SizedBox(
              height: 10.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Function3(teks: "ประวัติการให้เกรดเนื้อ"),
                Function4(teks: "ประวัติการวิเคราะห์"),
              ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Function5(teks: "ตำแหน่งเนื้อ"),
                Function6(teks: "ออกจากระบบ"),
              ],
            ),
          ],
        ),
      ],
      ),
    );
  }
}

class Function1 extends StatelessWidget{ //class สร้างfunction

  Function1 ({this.teks});

  final String teks;

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
          color: Color(0xFFEBE4D6),borderRadius: new BorderRadius.circular(0.0)
      ),
      alignment: Alignment.center,
      padding: new EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 30.0),//ระยะห่างของแต่ละบรรทัด
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Assessment()
          )); //MaterialPageRoute
        },
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/checklist.png',width: 125.0,height: 125.0,fit: BoxFit.cover,),
            new Text(teks, style: new TextStyle(fontSize: 20.0,color: Colors.black54),),
            new Padding(padding: new EdgeInsets.all(0.0),),

          ],
        ),
      ),
    );
  }
}
class Function2 extends StatelessWidget{ //class สร้างfunction

  Function2 ({this.teks});

  final String teks;

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
          color: Color(0xFFEBE4D6),borderRadius: new BorderRadius.circular(0.0)),
      alignment: Alignment.center,
      padding: new EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 30.0),//ระยะห่างของแต่ละบรรทัด
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => App()
          )); //MaterialPageRoute
        },
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/research.png',width: 125.0,height: 125.0,fit: BoxFit.cover,),
            new Text(teks, style: new TextStyle(fontSize: 20.0,color: Colors.black54),),
            new Padding(padding: new EdgeInsets.all(0.0),),
          ],
        ),
      ),
    );
  }
}

class Function3 extends StatelessWidget{ //class สร้างfunction

  Function3 ({this.teks});

  final String teks;

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
          color: Color(0xFFEBE4D6),borderRadius: new BorderRadius.circular(0.0)
      ),
      alignment: Alignment.center,
      padding: new EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 30.0),//ระยะห่างของแต่ละบรรทัด
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => HisAssess()
          )); //MaterialPageRoute
        },
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/hisassess.png',width: 125.0,height: 125.0,fit: BoxFit.cover,),
            new Text(teks, style: new TextStyle(fontSize: 20.0,color: Colors.black54),),
            new Padding(padding: new EdgeInsets.all(0.0),),
          ],
        ),
      ),
    );
  }
}

class Function4 extends StatelessWidget{ //class สร้างfunction

  Function4 ({this.teks});

  final String teks;

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
          color: Color(0xFFEBE4D6),borderRadius: new BorderRadius.circular(0.0)
      ),
      alignment: Alignment.center,
      padding: new EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 30.0),//ระยะห่างของแต่ละบรรทัด
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => HisAna()
          )); //MaterialPageRoute
        },
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/hisana.png',width: 125.0,height: 125.0,fit: BoxFit.cover,),
            new Text(teks, style: new TextStyle(fontSize: 20.0,color: Colors.black54),),
            new Padding(padding: new EdgeInsets.all(0.0),),
          ],
        ),
      ),
    );
  }
}

class Function5 extends StatelessWidget{ //class สร้างfunction

  Function5 ({this.teks});

  final String teks;

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
          color: Color(0xFFEBE4D6),borderRadius: new BorderRadius.circular(0.0)
      ),
      alignment: Alignment.center,
      padding: new EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 30.0),//ระยะห่างของแต่ละบรรทัด
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LocationPage()
          )); //MaterialPageRoute
        },
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/position.png',width: 125.0,height: 125.0,fit: BoxFit.cover,),
            new Text(teks, style: new TextStyle(fontSize: 20.0,color: Colors.black54),),
            new Padding(padding: new EdgeInsets.all(0.0),),
          ],
        ),
      ),
    );
  }
}

class Function6 extends StatelessWidget{ //class สร้างfunction

  Function6 ({this.teks});

  final String teks;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
          color: Color(0xFFEBE4D6),borderRadius: new BorderRadius.circular(0.0)
      ),
      alignment: Alignment.center,
      padding: new EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 30.0),//ระยะห่างของแต่ละบรรทัด
      child: GestureDetector(
        onTap: () {
          signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => LoginPageV2()
          )); //MaterialPageRoute
        },
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/logout.png',width: 125.0,height: 125.0,fit: BoxFit.cover,),
            new Text(teks, style: new TextStyle(fontSize: 20.0,color: Colors.black54),),
            new Padding(padding: new EdgeInsets.all(0.0),),
          ],
        ),
      ),
    );
  }
  void signOut() async{
    _firebaseAuth.signOut();
  }
}