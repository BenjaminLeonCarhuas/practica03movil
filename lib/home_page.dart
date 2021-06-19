import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 30),
                  Text(
                    'Kudos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(Icons.shopping_bag_outlined, size: 30)
                ],
              ),
              Carrusel(),
              Text(
                'ALL'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Scroll(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.black26),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black26),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Color.fromRGBO(68, 92, 254, 1),
                  boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0))],
                ),
                child: Center(
                  child:
                      FaIcon(FontAwesomeIcons.solidHeart, color: Colors.white),
                ),
              ),
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.comment, color: Colors.black26),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, color: Colors.black26),
            label: ' ',
          ),
        ],
      ),
    );
  }
}

class Scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 18),
        child: SingleChildScrollView(
          child: ContenedorContenido(),
        ),
      ),
    );
  }
}

class ContenedorContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CotenidoScroll('Microware Oven', 4.6),
        CotenidoScroll('Whisk', 3.0),
        CotenidoScroll('Speackers', 4.6),
        CotenidoScroll('Air Conditioner', 5.0),
        CotenidoScroll('Television', 5.0),
      ],
    );
  }
}

class CotenidoScroll extends StatelessWidget {
  final texto;
  final estrellas;

  const CotenidoScroll(this.texto, this.estrellas);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(size.width * 0.025),
      margin: EdgeInsets.symmetric(vertical: size.width * 0.015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset('src/$texto' + '.png', width: 45),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$texto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text('$estrellas'),
            ],
          ),
          Expanded(child: SizedBox()),
          FaIcon(
            FontAwesomeIcons.ellipsisV,
            color: Color.fromRGBO(208, 208, 210, 1),
          ),
        ],
      ),
    );
  }
}

class Carrusel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarruselParte1(),
          CarruselParte2(size),
        ],
      ),
    );
  }
}

class CarruselParte2 extends StatelessWidget {
  final size;
  CarruselParte2(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 11, bottom: 34),
      width: double.infinity,
      height: size.height * 0.2,
      child: PageView(
        children: [
          _ContenedorT('Washer Machine', 'lavadora.png', 4.6),
          _ContenedorT('Washer Machine', 'lavadora.png', 4.6),
          _ContenedorT('Dryer Machine', 'horno.png', 3.4),
        ],
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.85),
      ),
    );
  }
}

class CarruselParte1 extends StatelessWidget {
  const CarruselParte1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'favourites',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          minWidth: 100,
          color: Color.fromRGBO(68, 92, 254, 1),
          height: 40,
          onPressed: () {},
          child: Text(
            'VIEW ALL'.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _ContenedorT extends StatelessWidget {
  _ContenedorT(this.texto, this.imagen, this.estrellas);
  final texto;
  final imagen;
  final estrellas;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(size.height * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContenedorTParte1(imagen),
          Text(
            texto,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ContenedorTParte2(estrellas),
        ],
      ),
    );
  }
}

class ContenedorTParte2 extends StatelessWidget {
  const ContenedorTParte2(this.estrellas);

  final estrellas;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            'Ready Wash Stainless',
            style: TextStyle(fontSize: 11, color: Colors.black38),
          ),
          Expanded(child: SizedBox()),
          Text(
            '$estrellas',
            style: TextStyle(fontSize: 11, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}

class ContenedorTParte1 extends StatelessWidget {
  const ContenedorTParte1(this.imagen);

  final imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('src/$imagen', width: 35),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 3),
              ],
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.solidPaperPlane,
                color: Color.fromRGBO(78, 91, 235, 1),
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
