import 'dart:io';

import 'package:flutter/material.dart';

import 'model.dart';

class StudentProfileScreen extends StatelessWidget {
  final StudentModel student;

  StudentProfileScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
             GestureDetector(
                    onTap: () {
                      if (student.imageurl != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.file(File(student.imageurl!)),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: CircleAvatar(
                      radius: 80,
                       backgroundImage: student.imageurl != null
                    ? FileImage(File(student.imageurl!))
                    : null,
                child: student.imageurl == null ? Icon(Icons.person) : null,
                    ),
                  ),
            SizedBox(height: 20),
            Text(
              student.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Roll No: ${student.rollno}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Department: ${student.department}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Phone Number: ${student.phoneno.toString()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

