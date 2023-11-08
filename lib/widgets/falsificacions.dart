import 'package:flutter/material.dart';
import 'package:app_falsiicacion_de_dinero/models/models.dart';


class falsificacions extends StatelessWidget {

  final Falsificacion falsificacion; 

  const falsificacions({Key? key, required this.falsificacion}): super(key: key);  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Container(
        margin: EdgeInsets.only( top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _falsificacionsBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [

            _BackgroundImage(falsificacion.picture),

            _FalsificacionDetails(
              title: falsificacion.name,
              subTitle: falsificacion.id!,
            ),
            Positioned(
              top: 0,
             left: 0,
              child: _PriceTag()),
              
              Positioned(
              top: 0,
              right: 0,
              child: _NotAvailable()
              ),
          ],
        ),
      ),
    );
      
  }

  BoxDecoration _falsificacionsBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        offset: Offset(0,6),
        blurRadius: 10
      )
    ]
  );
}

class _NotAvailable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 10), 
          child: Text(
            'Cuida tu Bolsillo', 
            style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
         gradient: LinearGradient (
      colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color.fromRGBO(204, 17, 17, 1)
      ] ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 10), 
          child: Text('Autenticacion', style: TextStyle(color: Color.fromARGB(197, 3, 3, 3), fontSize: 70) )),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
    );
  }
}

class _FalsificacionDetails extends StatelessWidget {

  final String title;  
  final String subTitle;

  const _FalsificacionDetails({
    required this.title, 
    required this.subTitle
    }); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Caracteristicas de Seguridad del',
            style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
             Text(
              title,
            style: TextStyle( fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient (
      colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color.fromRGBO(204, 17, 17, 1)
      ] ),
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
  );
}

class _BackgroundImage extends StatelessWidget {

final String? url;

const _BackgroundImage( this.url );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
      width: double.infinity,
      height: 400,
      child: FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image:  NetworkImage(url!),
        fit: BoxFit.cover,
      ),
      ),
    );
    
  }
}