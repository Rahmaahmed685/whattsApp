import 'package:flutter/material.dart';
import 'package:notes/color.dart';
import 'package:notes/model/note.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;
  const EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final imageController = TextEditingController();
  bool favorite = false;
  bool isChecked = false;
  String? saveTitle ;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
    imageController.text = widget.note.image;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar:  AppBar(title: Text("Edit Note"),backgroundColor: mainColor,),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(children: [
            Checkbox(
                value: isChecked,
                onChanged: (value){
                  setState(() {
                    isChecked = value!;
                    if(value == isChecked) {
                      saveTitle = 'This Is Important Note';
                    } });
                }
            ),
            TextFormField(
            controller: imageController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(border: OutlineInputBorder(),
              label: Text("Enter URL"),
            ),
            ),
            SizedBox(height: 10),
            TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(),
                  label: Text("tittle"),

                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Tittle";
                  }
                  return null;
                }
            ),
            SizedBox(height: 10,),

            TextFormField(
              maxLines: 5,
                controller: contentController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(),
                  label: Text("content"),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter content";
                  }
                  return null;
                }
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => updateNote(), child: Text("Update"),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),backgroundColor: mainColor,),),
            ),
          ],),
        ),
      ),
    );
  }
  void updateNote(){
    if(!formKey.currentState!.validate()){
      return;
    }
    String title = titleController.text;
    String content = contentController.text;
    String image = imageController.text;
    String checked = saveTitle.toString();
    final note = Note(title, content,image,checked);

    Navigator.pop(context,note);
  }
}



