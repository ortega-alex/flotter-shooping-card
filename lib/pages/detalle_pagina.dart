import 'package:flutter/material.dart';

class DetallePagina extends StatefulWidget {
  final nombre;
  final precio;
  final imagen;

  const DetallePagina({this.nombre, this.precio, this.imagen});

  @override
  _DetallePaginaState createState() => _DetallePaginaState();
}

class _DetallePaginaState extends State<DetallePagina> {
  int _counter = 0;
  int _total = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _calcular() {
    var numero1 = widget.precio;
    int numero2 = _counter;
    int resul = numero1 * numero2;
    setState(() {
      _total = resul;
      print(_total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD0202),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restaurant_menu),
            onPressed: null,
            color: Colors.white,
          ),
        ],
        title: Text(
          'Detalle',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 140,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                  top: 15,
                  right: 80,
                  bottom: 25,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45),
                            bottomRight: Radius.circular(45))),
                    height: MediaQuery.of(context).size.height - 140,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                top: (MediaQuery.of(context).size.width / 2) + 30,
                left: (MediaQuery.of(context).size.width / 2) - 47,
                child: Hero(
                  tag: widget.imagen,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage(widget.imagen),
                            fit: BoxFit.cover)),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                  top: 50,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.nombre,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Precio: ',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          Text(
                            widget.precio.toString(),
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        'Cant: $_counter',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.blue[400],
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(75),
                              bottomLeft: Radius.circular(75),
                            )),
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(8),
                        child: new Column(
                          children: <Widget>[
                            SizedBox(
                              height: 28,
                            ),
                            new IconButton(
                                icon: new Icon(
                                  Icons.add,
                                  color: Colors.yellow,
                                ),
                                onPressed: () {
                                  _incrementCounter();
                                  _calcular();
                                }),
                            new IconButton(
                                icon: new Icon(Icons.fiber_smart_record),
                                onPressed: () {}),
                            new IconButton(
                                icon: new Icon(
                                  Icons.remove,
                                  color: Colors.yellow,
                                ),
                                onPressed: () {
                                  _decrementCounter();
                                  _calcular();
                                }),
                            SizedBox(
                              height: 28,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(20),
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.blue[400],
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(75),
                                bottomLeft: Radius.circular(25)),
                            color: Colors.green[700]),
                        child: Text(
                          'Total: $_total',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
