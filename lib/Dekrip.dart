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
    final img.Image image = img.Image(width: 128,height: 128);

    
    for (int i = 25; i < 81; i++) {
      final index = (100 * 128 + i);
      final offset = index * 4;

      
      // final r = pixels[offset];   
      // final g = pixels[offset + 1];            
      // final b = pixels[offset + 2];        
     


    final b = pixels[offset];    // Blue channel
    final g = pixels[offset + 1];// Green channel
    final r = pixels[offset + 2];// Red channel 
    final a = pixels[offset + 3];// Alpha channel
      print("$index = $r,$g,$b... $r$g$b");
      message = message + "$r$g$b";
      
    }

     print(message);
  }






}
