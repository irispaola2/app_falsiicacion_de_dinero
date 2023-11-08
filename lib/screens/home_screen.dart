

import 'package:app_falsiicacion_de_dinero/models/models.dart';
import 'package:app_falsiicacion_de_dinero/screens/screens.dart';
import 'package:app_falsiicacion_de_dinero/services/services.dart';
import 'package:app_falsiicacion_de_dinero/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    final falsificacionService = Provider.of<FalsificacionService> (context);
    if(falsificacionService.isLoading) return LoadingScreen(); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona la opcion que deseas ver las caracteristicas de seguridad del billete'),
      ),
    body: ListView.builder(
      itemCount: falsificacionService.falsificacions.length,
      itemBuilder: ( BuildContext context, index) => GestureDetector(
        onTap: () {
          falsificacionService.selectedFalsificacion= falsificacionService.falsificacions[index].copy();
        Navigator.pushNamed(context, 'falsificacion');
        },
        child: falsificacions(
          falsificacion: falsificacionService.falsificacions[index],
        )
        )
       ),
       floatingActionButton: FloatingActionButton(
        child: Icon (Icons.add),
        onPressed: () {
          falsificacionService.selectedFalsificacion = new Falsificacion(
            name: '', 
            valor: 0,
            caracteristica1: '', 
            caracteristica2: '',

            );
          Navigator.pushNamed(context, 'falsificacion'); 

        },
       ),
    );
  }
}