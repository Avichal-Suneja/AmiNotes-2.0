import 'package:aminotes2/models/Subject.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService
{
  // CREATING REFERENCE TO STORAGE BUCKET AND COLLECTIONS IN FIRE-STORE
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: 'gs://aminotes-3cd98.appspot.com');
  final CollectionReference subjectCollection = FirebaseFirestore.instance.collection('first_year_subjects');
  final CollectionReference secondSubjectCollection = FirebaseFirestore.instance.collection('second_year_subjects');
  final CollectionReference thirdSubjectCollection = FirebaseFirestore.instance.collection('third_year_subjects');


  // CONVERT DATABASE SUBJECT TO LOCAL MODEL SUBJECT
  Subject _convertToSubject(QueryDocumentSnapshot record){
    return Subject(displayName: record.get('displayName'), UrlList: record.get('UrlList'), NotesList: record.get('NotesList'));
  }


  // GET A LIST OF ALL FIRST YEAR SUBJECTS IN MODEL SUBJECT FORMAT
  Future getAllSubjects() async {
    List<Subject> allSubjects = [];
    await subjectCollection.get().then((querySnapshot) {
      for(int i=0; i<querySnapshot.docs.length; i++){
        allSubjects.add(_convertToSubject(querySnapshot.docs[i]));
      }
    });
    return allSubjects;
  }


  // GET A LIST OF ALL SECOND YEAR SUBJECTS IN MODEL SUBJECT FORMAT
  Future getAllSecondSubjects() async {
    List<Subject> allSubjects = [];
    await secondSubjectCollection.get().then((querySnapshot) {
      for(int i=0; i<querySnapshot.docs.length; i++){
        allSubjects.add(_convertToSubject(querySnapshot.docs[i]));
      }
    });
    return allSubjects;
  }


  // GET A LIST OF ALL THIRD YEAR SUBJECTS IN MODEL SUBJECT FORMAT
  Future getAllThirdSubjects() async {
    List<Subject> allSubjects = [];
    await thirdSubjectCollection.get().then((querySnapshot) {
      for(int i=0; i<querySnapshot.docs.length; i++){
        allSubjects.add(_convertToSubject(querySnapshot.docs[i]));
      }
    });
    return allSubjects;
  }
}