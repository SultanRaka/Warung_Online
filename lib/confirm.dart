import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'main.dart' as main;

class Confirm extends StatelessWidget {
  final orderItem;
  final orderQuantity;
  final total;
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  String detil = "";

  Confirm({this.orderItem, this.total, this.orderQuantity});

  void addData() {
    var url = "http://10.0.2.2/warung_makan/post2.php";

    http.post(url, body: {
      "nama": nama.text,
      "alamat": alamat.text,
      "detil": this.detil,
      "total": this.total.toString(),
    });
  }

  cetakCetak() {
    int x = 0;
    while (x < this.orderItem.length) {
      this.detil =
          this.detil + ("${this.orderItem[x]} ${this.orderQuantity[x]} pcs \n");
      x++;
    }
  }

  Future<void> invalid(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid'),
          content: const Text('Pastikan semua form terisi dengan benar!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> valid(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pesanan anda akan segera dikirim!"),
          content: const Text('Silahkan tunggu'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => main.Menu()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 100, left: 50),
            child: Row(
              children: <Widget>[
                Text("Daftar Pesanan"),
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: 50, top: 110),
          child: new ListView.builder(
              itemCount: this.orderItem.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: new Text(this.orderItem[index].toString()),
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: new Text(
                              this.orderQuantity[index].toString() + "pcs"),
                        ),
                      ],
                    )),
                  ],
                ));
              }),
        ),
        Container(
          width: 250,
          margin: EdgeInsets.only(left: 50, top: 300),
          child: Text("Nama"),
        ),
        Container(
          width: 250,
          margin: EdgeInsets.only(left: 50, top: 325),
          child: TextField(
            controller: nama,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, top: 375),
          child: Text("Alamat"),
        ),
        Container(
          width: 250,
          margin: EdgeInsets.only(left: 50, top: 400),
          child: TextField(
            controller: alamat,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 50, top: 475),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Total harga: "),
                    Text(this.total.toString())
                  ],
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => main.Menu()),
                        );
                      },
                      child: Text("Kembali"),
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      onPressed: () {
                        if ((nama.text == null) |
                            (alamat.text == null) |
                            (nama.text == "") |
                            (alamat.text == "") |
                            (orderItem == null) |
                            (total <= 0)) {
                          invalid(context);
                        } else {
                          cetakCetak();
                          addData();
                          valid(context);
                        }
                      },
                      child: Text("Konfirmasi"),
                    )
                  ],
                )
              ],
            )),
      ],
    ));
  }
}
