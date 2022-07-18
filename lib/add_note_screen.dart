import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  //final controllerTitle  = TextEditingController();
  //final controllerDescription = TextEditingController();
  //final controllerLink = TextEditingController();

  TextEditingController sampleTitle = new TextEditingController();
  TextEditingController sampleDescription = new TextEditingController();

  addData() {
    Map<String, dynamic> demoData = {
      "title": "Korean Scholarship",
      "description": "hjdvshdblvsidvb"
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('notes');
    //collectionReference.add(demoData);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    sampleTitle.dispose();
    sampleDescription.dispose();
    super.dispose();
  }

  clearText() {
    sampleTitle.clear();
    sampleDescription.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Add Note",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            SizedBox(height: 30),
            TextField(
              controller: sampleTitle,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Enter Title',
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: sampleDescription,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Text('Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(primary: Colors.black),

              onPressed: () {
                Map<String, dynamic> data = {
                  "title": sampleTitle.text,
                  "description": sampleDescription.text
                };
                FirebaseFirestore.instance
                    .collection("notes")
                    .add(data)
                    .whenComplete(() => Navigator.pop(context));
              },
              // addData,
            ),
          ],
        ));
  }
}
