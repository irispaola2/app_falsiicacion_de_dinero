

import 'dart:convert';
//import 'dart:io';

import 'package:http/http.dart' as http; 
import 'package:app_falsiicacion_de_dinero/models/falsificacion.dart';
import 'package:flutter/material.dart';

class FalsificacionService extends ChangeNotifier{

  final String _baseUrl = 'flutter-billete-default-rtdb.firebaseio.com'; 
  final List<Falsificacion> falsificacions = []; 
  late Falsificacion selectedFalsificacion; 
  //File? newPictureFile; 


  bool isLoading = true; 
  bool isSaving = false; 
  FalsificacionService(){
    this.loadProducts();
  }
  Future loadProducts() async{

    this.isLoading = true; 
    notifyListeners();
    final url = Uri.https(_baseUrl, 'Falsificacion.json');
    final resp = await http.get(url);
    final Map<String, dynamic> falsificacionMap = json.decode(resp.body) ;
    
    falsificacionMap.forEach((key, value) {
      final temFalsificacion = Falsificacion.fromMap(value );
      temFalsificacion.id = key; 
      this.falsificacions.add(temFalsificacion); 
    });
    this.isLoading = false; 
    notifyListeners();
  return this.falsificacions; 
  }

  Future saveOrCreateFalsificacion(Falsificacion falsificacion) async{
    isSaving = true; 
    notifyListeners(); 
    if(falsificacion.id == null ){
      //es necesario crear
      await this.createFalsificacion(falsificacion); 
    }else{
      //actualizar
      await this.updateFalsificacion(falsificacion); 
    }
    isSaving = false; 
    notifyListeners(); 
  }
  Future<String> updateFalsificacion(Falsificacion falsificacion) async{
    final url = Uri.https(_baseUrl, 'Falsificacion/${falsificacion.id }.json');
    final resp = await http.put(url, body: falsificacion.toJson()); 
    final decodedData = resp.body; 
     //print(decodedData); 
     //actualiza el listado de productos 
     final index = this.falsificacions.indexWhere((element) => element.id == falsificacion.id); 
     this.falsificacions[index] = falsificacion; 
     return falsificacion.id!; 
  }

    Future<String> createFalsificacion(Falsificacion falsificacion) async{
    final url = Uri.https(_baseUrl, 'Falsificac ion.json');
    final resp = await http.post(url, body: falsificacion.toJson()); 
    final decodedData = json.decode(resp.body);
    falsificacion.id = decodedData['name']; 
    this.falsificacions.add(falsificacion); 


     return falsificacion.id!; 
  }

/*   void updateSelectedFalsificacionImage (String path){
    this.selectedFalsificacion.picture=path;
    this.newPictureFile= File.fromUri(Uri(path: path)); 
    notifyListeners(); 
  }
   */
  
}