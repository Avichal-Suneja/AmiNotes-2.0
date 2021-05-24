class Subject
{
  List<dynamic> UrlList; // LIST OF STRINGS OF SAMPLE PAPER URLS
  List<dynamic> NotesList; // LIST OF STRINGS OF NOTES URLS
  String displayName; // NAME TO BE DISPLAYED TO THE USER

  Subject({this.displayName, this.UrlList, this.NotesList});
}