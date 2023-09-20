import 'package:flutter/material.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/colors.dart';
import 'package:notes/screens/edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notes = ["First Note"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGround,
        title: Text("Your Notes", style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 33,
          color: mainColor,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.list,
              color: mainColor,
              size: 30,
            ),
            onPressed: () {},
          )
        ],),
      floatingActionButton: FloatingActionButton(onPressed: ()=> openAddNoteScreen(),
        child: Icon(Icons.add),
        backgroundColor: mainColor,
      ),
      body:

      ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return buildNoteItem(index);
        },
      ),

    );
  }

  Widget buildNoteItem(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: contaierColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              notes[index],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),

            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    notes.removeAt(index);
                    setState(() {

                    });
                  },
                  icon: Icon(Icons.delete),
                  label: Text("Delete"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                      backgroundColor: deleteColor),),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => editNote(index), icon: Icon(Icons.edit), label: Text("Edit"),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: editColor),),
              ),

            ],)
        ],),);
  }

 void openAddNoteScreen() {
    Navigator.push(context, MaterialPageRoute(builder:
        (context) => AddNoteScreen(),
    )).then((value) => addNewNote(value),);
  }

  void addNewNote(String value) {
    notes.add(value);
    setState(() {

    });
  }

   void editNote(int index) {
     Navigator.push(context, MaterialPageRoute(
       builder: (context) => EditNoteScreen(title: notes[index],),)).then((value) => updateCurrentNote(index, value));
   }

  void updateCurrentNote(int index, value) {
    notes[index] = value;
    setState(() {

    });
  }
}