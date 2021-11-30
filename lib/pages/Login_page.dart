import 'package:flutter/material.dart';
import 'package:todo/pages/Home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset("assets/LBA.png"),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset("assets/siaep.png"),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 65,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color.fromRGBO(58, 141, 192, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Center(
                    child: (Text(
                      "Entrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ), 
                      //textAlign: TextAlign.center,
                    )),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
