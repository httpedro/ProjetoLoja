import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:libelulas/models/section.dart';

class HomeManager extends ChangeNotifier{

  bool loading = false;

  HomeManager(){
    _loadSections();
  }

  List<Section> _sections = [];

  List<Section> _editingSections = [];

  bool editing = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadSections() async{
    firestore.collection('home').snapshots().listen((snapshot){
      _sections.clear();
      for(final DocumentSnapshot document in snapshot.docs){
        _sections.add(Section.fromDocument(document));
      }
      notifyListeners();
    });
  }

  void addSection(Section section){
    _editingSections.add(section);
    notifyListeners();
  }

  List<Section> get sections {
    if(editing)
      return _editingSections;
    else
      return _sections;
  }

  void enterEditing(){
    editing = true;
    _editingSections = _sections.map((s) => s.clone()).toList();
    notifyListeners();
  }

  void saveEditing(){
    editing = false;
    notifyListeners();
  }

  void discardEditing(){
    editing = false;
    notifyListeners();
  }
}