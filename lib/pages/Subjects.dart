import 'package:aminotes2/models/Subject.dart';
import 'package:aminotes2/pages/Loading.dart';
import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {

  // INITIALIZING LOCAL VARIABLES
  List<Subject> subjectList;
  List<Subject> subjectListForDisplay;
  bool loading = true;
  Map data;

  // GETTING DATA AND SUBJECT LIST FROM THE HOME SCREEN INTO LOCAL VARIABLES
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      data = ModalRoute.of(context).settings.arguments;
      subjectList = data['list'];
      subjectListForDisplay = subjectList;
      setState(() {
        loading = false;
      });
    });
  }

  // POPUP DIALOGUE FOR THE USER TO CHOOSE BETWEEN NOTES OR SAMPLE PAPERS
  createPopUp(BuildContext context, int index){
    return showDialog(context: context, builder: (context) {
      return Dialog(
        backgroundColor: Colors.teal[400],
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/night.jpeg'),
                  fit: BoxFit.cover
              )
          ),
          height: 300.0,
          width: 600.0,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.note_rounded),
                  label: Text(
                    'Notes',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[400]),
                  ),
                  onPressed: () {
                    // SENDING NOTES TO THE PDF-VIEWER SCREEN
                    Navigator.pushNamed(context, '/pdfViewer', arguments: {
                      'UrlList' : subjectListForDisplay[index].NotesList,
                      'name' : subjectListForDisplay[index].displayName,
                      'notes' : true
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.note_rounded),
                  label: Text(
                    'Sample Papers',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[400]),
                  ),
                  onPressed: () {
                    // SENDING SAMPLE PAPERS TO THE PDF-VIEWER SCREEN
                     Navigator.pushNamed(context, '/pdfViewer', arguments: {
                          'UrlList' : subjectListForDisplay[index].UrlList,
                          'name' : subjectListForDisplay[index].displayName,
                          'notes' : false
                        });
                  },
                ),
              ),
            ],
          ),
        )
      );
    });
  }

  //THE MAIN BUILD FUNCTION
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        title: Text(
          data['name'] + ' Subjects',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/night.jpeg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.teal[200],
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                onChanged: (text) {
                  // ADDING ONLY THE SUBJECTS MATCHING SEARCH QUERY TO subjectListForDisplay
                  text = text.toLowerCase();
                  setState(() {
                    subjectListForDisplay = subjectList.where((subject) {
                      var displayName = subject.displayName.toLowerCase();
                      return displayName.contains(text);
                    }).toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: subjectListForDisplay.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        createPopUp(context, index);
                      },
                      child: Container(
                        height: 90,
                        width: 180,
                        child: Card(
                          color: Colors.teal[300],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 15.0),
                              Image(
                                image: AssetImage('assets/book.png'),
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(width: 20.0),
                              Text(
                                subjectListForDisplay[index].displayName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
