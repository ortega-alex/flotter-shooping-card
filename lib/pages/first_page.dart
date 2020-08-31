import 'package:apptracker/pages/detalle_pagina.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: <Widget>[
                Text(
                  "Comida a domicilio",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 160,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(75),
                    bottomLeft: Radius.circular(75))),
            child: ListView(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.1,
                      childAspectRatio: 0.700,
                      children: <Widget>[
                        // de momento como no se conecta a una base de datos vamos a crear
                        // un widget que nos pinte esa informacion aqui
                        _comidaItem('Sucos', 25, 'assets/images/1.jpeg'),
                        _comidaItem('Tostadas', 25, 'assets/images/2.jpg'),
                        _comidaItem('Wendys', 25, 'assets/images/3.jpg'),
                        _comidaItem('Mac donals', 25, 'assets/images/4.jpeg'),
                        _comidaItem(
                            'Papas con queso', 25, 'assets/images/5.jpg'),
                        _comidaItem(
                            'Ensalada de pollo', 25, 'assets/images/6.jpeg'),
                        _comidaItem('Pollo', 25, 'assets/images/7.jpg'),
                        _comidaItem('Burger King', 25, 'assets/images/8.jpg')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _comidaItem(String nombre, int precio, String imagen) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFE6E4EB),
          elevation: 5,
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: imagen,
                child: new Material(
                  child: Container(
                    color: Color(0xFFE6E4EB),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => DetallePagina(
                                    nombre: nombre,
                                    precio: precio,
                                    imagen: imagen,
                                  ))),
                      child: new Image.asset(
                        imagen,
                        fit: BoxFit.contain,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
              ),
              Text(
                nombre,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Padding(padding: EdgeInsets.all(3)),
              Text(
                precio.toString(),
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
