import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class Dekrip{

  late Uint8List pixels;
  String bin="";
  String name="";
  int score=0;
 





  Future<void> getReady() async {

      try {
        
        
        final ByteData assetData = await rootBundle.load('assets/images/proof.png');
        final Uint8List assetBytes = assetData.buffer.asUint8List();

        
                
        final ui.Codec codec = await ui.instantiateImageCodec(assetBytes);
        final ui.FrameInfo frame = await codec.getNextFrame();
        final ui.Image uiImage = frame.image;


        
        final ByteData? imageData = await uiImage.toByteData(format: ui.ImageByteFormat.rawRgba);
        if (imageData == null) {return;}

        
        pixels = imageData.buffer.asUint8List();
      } on Exception catch (e) {

      }

  }

  
  Future<void> deCodeBinary() async {
  
      await getReady();
      await finishEveryThing();

  }



  Future<void> finishEveryThing() async {
    String message="";
    final img.Image image = img.Image(width: 256,height: 256);

    int posX = 0;
    for (int i = 0; i < 10; i++) {
      final index = (i * 128 + posX);
      final offset = index * 4;

      
      final r = pixels[offset];   
      final g = pixels[offset + 1];            
      final b = pixels[offset + 2];  
      
      print("$r,$g,$b");
      message = message + "$r$g$b";

    //   if(i<4){binScore+="$r$b";}
    //   else{
    //     if(i%4==0 && i!=4){
    //       if(binName=="00000000"){

    //         break;
    //       }
          
    //       final decimal = int.parse(binName, radix: 2);
    //       final char = String.fromCharCode(decimal);
    //       name+=char;
    //       binName="";
    //     }
    //     binName+="$r$b";
    //   }





     }
      print(message);




  }


}