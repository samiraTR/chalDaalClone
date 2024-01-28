import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tst_app2/themes/theme.dart';
import 'package:tst_app2/utils/theme.dart';

class POSMScreen extends StatefulWidget {
  @override
  _POSMScreenState createState() => _POSMScreenState();
}

class _POSMScreenState extends State<POSMScreen> {
   File? imageFile;
  final picker = ImagePicker();
  TextEditingController _numberOfTextFieldsController = TextEditingController();
  List<TextEditingController> _textControllers = [];

  @override
  void dispose() {
    _numberOfTextFieldsController.dispose();
    _textControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: white,
         title: Text("Rack Screen",style: TextStyle(color:white,fontSize: 20),),
         centerTitle: true,
          bottom:PreferredSize(
          preferredSize: const Size.fromHeight(90.0), child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: Row(
                children: [
                const  Expanded(flex: 1,
                    child: Text("Number of Rack ",style: TextStyle(fontSize: 16,color: Colors.white),)),
                  const  Expanded(flex: 1,
                      child: Text("  : ",style: TextStyle(fontSize: 16,color: Colors.white),)),
                  Expanded(
                    flex: 1,
                    
                  child: TextFormField(
                                  textDirection: TextDirection.rtl,
                                   decoration: InputDecoration(
                                     filled: true,
                                fillColor: Colors.white,
                                //hintText: va,
                                enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                width: 1, 
                                color: mainColor,
                                                   ), 
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                width: 1, 
                                color: mainColor,
                                                   ), 
                                                      ),
                              ),
                                   
                                  controller:  _numberOfTextFieldsController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  onChanged: ((value) {
                                   updateTextControllers();
                                  
                                    
                                  }),
                              
                                                  
                                                  
                                                    ),
                ),
                ],
              ),
          ),)

      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            Expanded(
              
              child: ListView.builder(
                itemCount: _textControllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      
                                     decoration: InputDecoration(
                                      prefixIcon: Image.asset("assets/icons/rack.png",),
                                      labelText: 'Rack ${index + 1}',
                                       filled: true,
                                  fillColor: Colors.transparent,
                                
                                  enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                  width: 1, 
                                  color: mainColor,
                                                     ), 
                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                  width: 1, 
                                  color: mainColor,
                                                     ), 
                                                        ),
                                ),
                                     
                                    controller:  _textControllers[index],
                                  
                                    keyboardType: TextInputType.number,
                                    onChanged: ((value) {
                                      
                                    }),
                                
                                                    
                                                    
                                                      ),
                  );

                },
              ),
            ),
            Expanded(child:imageFile != null
              ? Image.file(imageFile!) :const SizedBox() ),
                
           const SizedBox(height: 10,),
         imageFile == null?   GestureDetector(
                onTap: _capturePhoto,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Center(
                    child: Container(
                          color: white,
                          child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [           
                                    Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Container(
                                                height: 55,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                        color:const Color.fromARGB(255, 61, 80, 251),
                                                    
                                                    ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      "Take a Image ",
                                                      style: textSTYLEHeadline16,
                                                    ),
                                                    Image.asset("assets/icons/camera.png",color: white,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                   
                                  ],
                                ),
                        ),
                  ),
                ),
              ):GestureDetector(
                onTap: (){
                 Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Center(
                    child: Container(
                          color: white,
                          child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [           
                                    Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Container(
                                                height: 55,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                        color:const Color.fromARGB(255, 61, 80, 251),
                                                    
                                                    ),
                                                child:const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                     Text(
                                                      "Save",
                                                      style: textSTYLEHeadline16,
                                                    ),
                                                    //Image.asset("assets/icons/camera.png",color: white,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                   
                                  ],
                                ),
                        ),
                  ),
                ),
              )

          ],
        ),
      ),
    );
  }

  void updateTextControllers() {
    int numberOfTextFields = int.tryParse(_numberOfTextFieldsController.text) ?? 0;

    setState(() {
      _textControllers.clear();
      for (int i = 0; i < numberOfTextFields; i++) {
        _textControllers.add(TextEditingController());
      }
    });
  }

Future<void> _capturePhoto() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } else {
      print('Camera permission denied');
    }
  }
}