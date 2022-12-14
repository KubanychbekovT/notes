import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/feauters/Adder/presentation/pages/note_editor.dart';
import 'package:project/feauters/Adder/presentation/pages/note_reader.dart';
import 'package:project/feauters/Adder/presentation/settings/TextStyles/app_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/feauters/Adder/presentation/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Projects'),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent Notes",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                FirebaseFirestore.instance.collection("project").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((project) => noteCard(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                NoteReaderScreen(project),
                            ));
                      }, project))
                          .toList(),
                    );
                  }
                  return Text(
                    "ther's no Notes",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },

              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> NoteEditorScreen()));
          },
          label: Text("Add Note"),
          icon: Icon(Icons.add),
    ),
    );
  }
}


