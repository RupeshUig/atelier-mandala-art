import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig_admin/components/custom_categories_botton.dart';
import 'package:uig_admin/constants/constants.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _instructController = TextEditingController();
  TextEditingController _instructorDomainController = TextEditingController();
  // File? _aadharImage;
  // File? _importantDocumentImage;

  File? image;

  Future<void> _getImageFromCamera() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
          // this.pickedFile =pickedFile
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: additionalBlueLight,
        centerTitle: true,
        title: const Text(
          'HomePage',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.07,
                ),
                child: TextFormField(
                    controller: _descriptionController,
                    //  validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'This field is required';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 35, 20, 45),
                      labelText: 'Course Title',
                      labelStyle: TextStyle(
                          color: Color(0xff617193),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      // isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.07,
                ),
                child: TextFormField(
                    controller: _courseTitleController,
                    //  validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'This field is required';
                    //   }
                    //   return null;
                    // },
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 35, 20, 45),
                      labelText: 'Course Discription',
                      labelStyle: TextStyle(
                          color: Color(0xff617193),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      // isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              DottedBorder(
                  strokeWidth: 1.5,
                  dashPattern: [4, 4],
                  radius: Radius.circular(10),
                  child: Container(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.86,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.photo_album_outlined,
                            color: Colors.lightBlue,
                            size: 94.0,
                          ),
                          const Text(
                            'Drag or Drop file here',
                            style: TextStyle(
                              // fontFamily: ,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: const Color.fromARGB(255, 10, 10, 10),
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          const Text(
                            '-OR-',
                            style: TextStyle(
                              // fontFamily: ,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: const Color.fromARGB(255, 10, 10, 10),
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _showImagePickerDialog(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(0, 75, 184, 1))),
                            child: const Text(
                              'Choose File',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ]),
                  )),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.07,
                ),
                child: TextFormField(
                    controller: _instructController,
                    //  validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'This field is required';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 35, 20, 45),
                      labelText: 'Name of Instructor',
                      labelStyle: TextStyle(
                          color: Color(0xff617193),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      // isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      // floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.07,
                ),
                child: TextFormField(
                    controller: _instructorDomainController,
                    //  validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'This field is required';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 35, 20, 45),
                      labelText: 'Domain of Instructor',
                      labelStyle: TextStyle(
                          color: Color(0xff617193),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      // isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff00194A),
                          width: 1,
                        ),
                      ),
                      // floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomCategoriesButton(
                  text: 'Upload File',
                  color: additionalBlueLight,
                  textColor: Colors.white,
                  function: () {})
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.deepPurpleAccent,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: "My Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_rounded), label: "Library"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Account"),
          ]),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
