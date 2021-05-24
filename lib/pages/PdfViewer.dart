import 'package:flutter/material.dart';

class PdfViewer extends StatefulWidget {
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {

  // INITIALIZING LOCAL VARIABLES
  Map data;
  bool loading = false;
  String subjectName;
  List<dynamic> urls;
  String listText;

  // WIDGET IN CASE THERE ARE NO NOTES/SAMPLE PAPERS AVAILABLE
  noNotes(){
    return Center(
      child: Text(
        'Sorry No Material Available!',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white
        ),
      ),
    );
  }

  // THE MAIN BUILD FUNCTION
  @override
  Widget build(BuildContext context) {

    // GETTING DATA FROM SUBJECTS SCREEN ABOUT A PARTICULAR SUBJECT
    data = ModalRoute.of(context).settings.arguments;
    urls = data['UrlList'];
    subjectName = data['name'];
    if(urls.length == 1)
      listText = 'All Notes-';
    else
      listText = 'Module-';

    return Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal[400],
          title: Text(
            subjectName,
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
          child: urls[0]==''? noNotes() : Column(
            children: [
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: urls.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          // SENDING THE URL AND OTHER META DATA ABOUT THE PDF TO BE OPENED TO PDF SCREEN
                          Navigator.pushNamed(context, '/pdf', arguments: {
                            'url' : urls[index].toString(),
                            'index' : index,
                            'notes' : data['notes'],
                            'listText' : listText
                          });
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
                                  image: AssetImage('assets/pdf.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  data['notes']? listText + (index+1).toString(): 'Sample paper-' + (index+1).toString(),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white
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
