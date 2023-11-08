import 'package:app_falsiicacion_de_dinero/providers/falsificacion_form_provider.dart';
import 'package:app_falsiicacion_de_dinero/services/services.dart';
import 'package:app_falsiicacion_de_dinero/ui/input_decorations.dart';
import 'package:app_falsiicacion_de_dinero/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class FalsificacionScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final falsificacionService = Provider.of<FalsificacionService>(context); 
    return ChangeNotifierProvider(
      create: ( _ ) => FalsificacionFormProvider(falsificacionService.selectedFalsificacion),
      child: _FalsificacionScreenBody(falsificacionService: falsificacionService),
      );
    //return _FalsificacionScreenBody(falsificacionService: falsificacionService);

  }
}



class _FalsificacionScreenBody extends StatelessWidget {
  const _FalsificacionScreenBody({
    super.key,
    required this.falsificacionService,
  });

  final FalsificacionService falsificacionService;

  @override
  Widget build(BuildContext context) {

    final falsificacionForm = Provider.of<FalsificacionFormProvider>(context); 

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 30),
                  Text('En la nueva actualizacion tendra reconomiento de imagen...',
            style: TextStyle( fontSize: 20, color: Color.fromARGB(255, 248, 244, 244), fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),

            Stack(
              children: [
                FalsificacionImage( url: falsificacionService.selectedFalsificacion.picture),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon( Icons.arrow_back_ios_new,size: 40, color: Colors.white ),
                  ),
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {

                      final picker = new ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.camera, 
                      imageQuality: 100);
                       if(pickedFile == null ){
                      print('No selecciono imagen!!'); 
                       return;
                       }
                       print('ImagenCargando... ${pickedFile.path }'); 
                       //falsificacionService.updateSelectedFalsificacionImage(pickedFile.path); 
                    },
                    icon: Icon( Icons.camera_alt_outlined, size: 40, color: Color.fromARGB(255, 255, 254, 254) ),
                  ),
                ),

                Positioned(
                  top: 110,
                  right:20,
                  child: IconButton(
                    onPressed: () async {

                      final picker = new ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.gallery, 
                      imageQuality: 100);
                       if(pickedFile == null ){
                      print('No slecciono una imagen!!'); 
                       return;
                       }
                       print(' ImagenCargando... ${pickedFile.path}'); 
                       //falsificacionService.updateSelectedFalsificacionImage(pickedFile.path); 
                    },
                    icon: Icon( Icons.image_search, size: 40, color: Color.fromARGB(255, 255, 255, 255) ),
                  ),
                ),
                
              ],
            ),

            _falsificacionForm(),

            SizedBox( height: 100),
       
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () async{
          //guardar foto de persona
          if (!falsificacionForm.isValidForm()) return;
          await falsificacionService.saveOrCreateFalsificacion(falsificacionForm.falsificacion);
        },
      ) ,
    );
  }
}

 



class _falsificacionForm extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {




    final falsificacionForm = Provider.of<FalsificacionFormProvider>(context); 
    final falsificacion = falsificacionForm.falsificacion; 
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: falsificacionForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
        
              SizedBox( height: 10 ),

              TextFormField(
                initialValue: falsificacion.name,
                onChanged: ( value ) => falsificacion.name = value, 
                validator: ( value ) {
                  if (value == null || value.length <1)
                  return 'El dato es obligatorio ';
                  //se  agrego porque daba error 
                  return null; 
                  
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre de la persona',
                  labelText: 'Cozca su Billete : '
                ),

              ),

              SizedBox(height: 50),
              Text('Caracterisiticas para identificar la autentecidad : ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('del Billete ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
    
              TextFormField(
                initialValue: falsificacion.caracteristica1,
                onChanged: ( value ) => falsificacion.caracteristica1 = value, 
                validator: ( value ) {
                  if (value == null || value.length <1)
                  return 'El dato es obligatorio ';
                  //se  agrego porque daba error 
                  return null; 
                  
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Carteristicas',
                  labelText: 'Caracterisitica 1 '
                ),

              ),

              SizedBox( height: 10),

              TextFormField(
                initialValue: falsificacion.caracteristica2,
                onChanged: ( value ) => falsificacion.caracteristica2 = value, 
                validator: ( value ) {
                  if (value == null || value.length <1)
                  return 'El dato es obligatorio ' ;
                  //se  agrego porque daba error 
                  return null; 
                  
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Carteristicas',
                  labelText: 'Carteristica 2', 
                        ),
              ),

              SizedBox( height: 10),

          

              TextFormField(
                initialValue: falsificacion.caracteristica3,
                onChanged: ( value ) => falsificacion.caracteristica3 = value, 
                validator: ( value ) {
                  if (value == null || value.length <1)
                  return 'El dato es obligatorio ' ;
                  //se  agrego porque daba error 
                  return null; 
                  
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Carteristicas',
                  labelText: 'Carteristica: 3, Gire el billete y mire ', 
                        ),
              ),

              TextFormField(
                initialValue: falsificacion.caracteristica4,
                onChanged: ( value ) => falsificacion.caracteristica4 = value, 
                validator: ( value ) {
                  if (value == null || value.length <1)
                  return '' ;
                  //se  agrego porque daba error 
                  return null; 
                  
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Carteristicas',
                  labelText: 'Carteristica 4 ', 
                        ),
              ),
              
              TextFormField(
                initialValue: falsificacion.caracteristica5,
                onChanged: ( value ) => falsificacion.caracteristica5 = value, 
                validator: ( value ) {
                  if (value == null || value.length <1)
                  return '' ;
                  //se  agrego porque daba error 
                  return null; 
                  
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Carteristicas',
                  labelText: 'Carteristica 5', 
                        ),
              ),



          ],) ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25) ),
    boxShadow: [
      BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: Offset(0,5),
      blurRadius: 5
      )
    ]

  );
}




