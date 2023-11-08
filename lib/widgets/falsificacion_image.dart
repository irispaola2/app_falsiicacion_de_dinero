//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FalsificacionImage extends StatelessWidget {

  final String? url; 
  const FalsificacionImage({
    Key? key,
    this.url
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.only( topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            //child: getImage(url)
            child: this.url ==null
            ?
            Image(image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
            )
            : FadeInImage(
              image: NetworkImage(this.url!),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.cover,
            ),

          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 5)
                )
          ]
          );

         /*  Widget getImage(String? picture){
            
            if (picture == null){
            return Image(
               image:  AssetImage('assets/no-image.png'),
               fit:  BoxFit.cover,
            );
            }
      
            if (picture.startsWith('http'))
            return FadeInImage(
              image: NetworkImage(this.url! ),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.cover,
            );
        
          return Image.file(
                File(picture),
                fit: BoxFit.cover,
            );
          } */

}