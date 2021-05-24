import 'package:aminotes2/models/Subject.dart';
import 'package:aminotes2/pages/Loading.dart';
import 'package:aminotes2/utility/database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // INITIALIZING LOCAL VARIABLES
  List<Subject> firstYear;
  List<Subject> secondYear;
  List<Subject> thirdYear;
  DataBaseService _db = new DataBaseService();
  bool loading = true;


  // ASYNC FUNCTION TO GET ALL SUBJECTS DATA FROM FIREBASE INTO LOCAL VARIABLES
  getSubjectList() async {
    firstYear = await _db.getAllSubjects();
    secondYear = await _db.getAllSecondSubjects();
    thirdYear = await _db.getAllThirdSubjects();
    setState(() {
      loading = false;
    });
  }

  // CALLING getSubjectList() ONLY ONCE WHEN HOME SCREEN IS INITIALIZED
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getSubjectList();
    });
  }

  // WIDGET FOR DISPLAYING HOME SCREEN
  Widget homeScreen(){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/night.jpeg'),
              fit: BoxFit.cover
          )
      ),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Text(
                'Select your Year',
                style: TextStyle(
                    shadows: [Shadow(color: Colors.teal[600], blurRadius: 3.0)],
                    fontSize: 22.0,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                height: 40.0,
                width: 120.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[200]),
                  ),
                  child: Text(
                    '1st year',
                    style: TextStyle(
                      shadows: [Shadow(color: Colors.teal[600], blurRadius: 3.0)],
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    // SENDING FIRST YEAR SUBJECT LIST TO THE NEXT SCREEN TO DISPLAY
                    Navigator.pushNamed(context, '/subjects', arguments: {
                      'list' : firstYear,
                      'name' : '1st Year'
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 40.0,
                width: 120.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[300]),
                  ),
                  child: Text(
                    '2nd year',
                    style: TextStyle(
                      shadows: [Shadow(color: Colors.teal[600], blurRadius: 3.0)],
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    // SENDING SECOND YEAR SUBJECT LIST TO THE NEXT SCREEN TO DISPLAY
                    Navigator.pushNamed(context, '/subjects', arguments: {
                      'list' : secondYear,
                      'name' : '2nd Year'
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 40.0,
                width: 120.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[400]),
                  ),
                  child: Text(
                    '3rd year',
                    style: TextStyle(
                      shadows: [Shadow(color: Colors.teal[600], blurRadius: 3.0)],
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    // SENDING THIRD YEAR SUBJECT LIST TO THE NEXT SCREEN TO DISPLAY
                    Navigator.pushNamed(context, '/subjects', arguments: {
                      'list' : thirdYear,
                      'name' : '3rd Year'
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 40.0,
                width: 120.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[500]),
                  ),
                  child: Text(
                    '4th year',
                    style: TextStyle(
                      shadows: [Shadow(color: Colors.teal[600], blurRadius: 3.0)],
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // POPUP DIALOGUE FOR THE ABOUT DEVELOPER SECTION
  createPopUp(BuildContext context){
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
            height: 500.0,
            width: 600.0,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 8.0),
                Center(
                  child: Text(
                    'About the App',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'Cursive',
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'A small initiative to save you from the hassle of navigating through AmiNotes'
                          ' on your phone to find your notes and sample papers. We have added some of our'
                              ' own content too! Give me a heads up if you liked our work!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(color: Colors.teal[600], blurRadius: 10.0)],
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.message, color: Colors.white, size: 32.0),
                      label: Text('LinkedIn', style: TextStyle(color: Colors.white)),
                      onPressed: () async{
                        const _url = 'https://www.linkedin.com/in/avichal-suneja-1583b4193';
                        await launch(_url);
                      },
                    ),

                    TextButton.icon(
                      icon: Icon(Icons.crop_square_rounded, color: Colors.white, size: 32.0),
                      label: Text('Instagram', style: TextStyle(color: Colors.white)),
                      onPressed: () async{
                        const _url = 'https://www.instagram.com/avichal_suneja/';
                        await launch(_url);
                      },
                    ),
                  ],
                )
              ],
            ),
          )
      );
    });
  }

  // THE MAIN BUILD FUNCTION
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[500],
        title: Text(
          'AmiNotes 2.0',
          style: TextStyle(
              fontSize: 28.0,
              fontFamily: 'Cursive'
          ),
        ),
      ),
      body: homeScreen(),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/night.jpeg'),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            //padding: EdgeInsets.zero,
            children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal[500],
                  ),
                  child: Center(
                    child: Text(
                      'AmiNotes 2.0',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontFamily: 'Cursive'
                      ),
                    ),
                  ),
                ),

              Container(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: (){
                     createPopUp(context);
                    },
                    child: Container(
                      height: 90,
                      width: 240,
                      child: Card(
                        color: Colors.teal[300],
                        child: Center(
                          child: Text(
                            'About Developer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () async {
                      const _url = 'https://www.aminotes.com';
                      await launch(_url);
                    },
                    child: Container(
                      height: 90,
                      width: 240,
                      child: Card(
                          color: Colors.teal[300],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Credits',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  'aminotes.com',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
        ),
        ),
      );
  }
}
