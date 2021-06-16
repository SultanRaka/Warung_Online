import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'confirm.dart';
import "package:test/test.dart";

void main() => runApp(new MaterialApp(
      title: "Warung Makan",
      home: new Menu(),
    ));

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List menu;
  List orderedMenu = [];
  List orderedID = [];
  List orderedQuantity = [];
  List newStock = [];
  int total;
  List<int> number = [0, 0, 0, 0, 0, 0];
  final contol = TextEditingController();

  void add(int index) {
    int n = number[index];
    setState(() {
      n++;
      number[index] = n;
    });
  }

  void minus(int index) {
    int n = number[index];
    setState(() {
      if (n != 0) n--;
      number[index] = n;
    });
  }

  cetakOrder() {
    setState(() {
      if (number[0] != 0) {
        orderedMenu.add(menu[0]["nama"].toString());
        orderedQuantity.add(number[0]);
        int stoklama = int.parse(menu[0]["stock"]);
        int jumlahpesanan = number[0];
        int stokBaru = stoklama - jumlahpesanan;
        newStock.add(stokBaru);
        orderedID.add(menu[0]["id"].toString());
      }
      if (number[1] != 0) {
        orderedMenu.add(menu[1]["nama"].toString());
        orderedQuantity.add(number[1]);
        int stoklama = int.parse(menu[1]["stock"]);
        int jumlahpesanan = number[1];
        int stokBaru = stoklama - jumlahpesanan;
        newStock.add(stokBaru);
        orderedID.add(menu[1]["id"].toString());
      }
      if (number[2] != 0) {
        orderedMenu.add(menu[2]["nama"].toString());
        orderedQuantity.add(number[2]);
        int stoklama = int.parse(menu[2]["stock"]);
        int jumlahpesanan = number[2];
        int stokBaru = stoklama - jumlahpesanan;
        newStock.add(stokBaru);
        orderedID.add(menu[2]["id"].toString());
      }
      if (number[3] != 0) {
        orderedMenu.add(menu[3]["nama"].toString());
        orderedQuantity.add(number[3]);
        int stoklama = int.parse(menu[3]["stock"]);
        int jumlahpesanan = number[3];
        int stokBaru = stoklama - jumlahpesanan;
        newStock.add(stokBaru);
        orderedID.add(menu[3]["id"].toString());
      }
      if (number[4] != 0) {
        orderedMenu.add(menu[4]["nama"].toString());
        orderedQuantity.add(number[4]);
        int stoklama = int.parse(menu[4]["stock"]);
        int jumlahpesanan = number[04];
        int stokBaru = stoklama - jumlahpesanan;
        newStock.add(stokBaru);
        orderedID.add(menu[4]["id"].toString());
      }
      if (number[5] != 0) {
        orderedMenu.add(menu[5]["nama"].toString());
        orderedQuantity.add(number[5]);
        int stoklama = int.parse(menu[5]["stock"]);
        int jumlahpesanan = number[5];
        int stokBaru = stoklama - jumlahpesanan;
        newStock.add(stokBaru);
        orderedID.add(menu[5]["id"].toString());
      }
      if ((number[0] == 0) &
          (number[1] == 0) &
          (number[2] == 0) &
          (number[3] == 0) &
          (number[4] == 0) &
          (number[5] == 0)) {}
      cetakTotal();
      ;
    });
  }

  cetakTotal() {
    total = (int.parse(menu[0]["harga"]) * number[0]) +
        (int.parse(menu[1]["harga"]) * number[1]) +
        (int.parse(menu[2]["harga"]) * number[2]) +
        (int.parse(menu[3]["harga"]) * number[3]) +
        (int.parse(menu[4]["harga"]) * number[4]) +
        (int.parse(menu[5]["harga"]) * number[5]);
    //print("Total Harga: $total");
  }

  Future<List> getData() async {
    var response = await http.get(
        Uri.parse("http://10.0.2.2/warung_makan/getmenu.php"),
        headers: {"Accept": "application/json"});

    var resBody = json.decode(response.body);
    setState(() {
      menu = resBody;
    });
  }

  Widget getLoading() {
    return new Scaffold(
      body: Center(
        child: Text("Loading gan"),
      ),
    );
  }

  Widget cekLoading() {
    if (menu == null) {
      getData();
      return getLoading();
    } else {
      return mainFunction();
    }
  }

  Widget mainFunction() {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Warung Makan"),
      ),
      body: new ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, i) {
          return new Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Card(
              child: new Row(
                children: <Widget>[
                  new Image.asset(
                    menu[i]["url"].toString(),
                    height: 100,
                    width: 100,
                  ),
                  new Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: new Container(
                      width: 125,
                      child: new Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(menu[i]["nama"],
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(menu[i]["detil"],
                                textAlign: TextAlign.left),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: new Text(menu[i]["harga"],
                                  textAlign: TextAlign.left)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        minus(i);
                      },
                      child: new Center(
                        child: new Text(
                          "-",
                        ),
                      ),
                    ),
                    width: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  new Text(number[i].toString()),
                  SizedBox(
                    width: 10,
                  ),
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        add(i);
                      },
                      child: new Center(
                        child: new Text("+"),
                      ),
                    ),
                    width: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: new Row(
        children: <Widget>[
          Container(
              child: new RaisedButton(
            onPressed: () {
              cetakOrder();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Confirm(
                          total: total,
                          orderItem: orderedMenu,
                          orderQuantity: orderedQuantity,
                          orderItemID: orderedID,
                          orderItemStock: newStock,
                        )),
              );
            },
            child: new Text("Lanjut"),
          ))
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return cekLoading();
  }
}
