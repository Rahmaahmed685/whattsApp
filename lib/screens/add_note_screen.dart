import 'package:flutter/material.dart';
import 'package:notes/color.dart';
import 'package:notes/model/note.dart';
class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final imageController = TextEditingController();

  final formKey = GlobalKey<FormState>();
 bool favorite = false;
bool isChecked = false;
String? saveTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
    appBar:  AppBar(title: Text("Add Note"),backgroundColor: mainColor,),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(children: [
          Container(
          padding: EdgeInsets.all(10),
          child:
            Checkbox(
              activeColor: Colors.green,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                    if(value == isChecked){
                      saveTitle = 'This Is Important Note';
                    }
                  });
                }
            ),
            ),
            TextFormField(
            controller: imageController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(border: OutlineInputBorder(),
              label: Text("Enter URL"),
            ),
                validator: (value) {
                  if(!value!.startsWith('https') && value.startsWith(" ")){
                    return "invalid URL";
                  }
                  return null;
                }
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

            SizedBox(height: 10),

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
                onPressed: () => addNote(), child: Text("Add"),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),backgroundColor: mainColor,),),
            ),
],)
            ),

      ),
    );
  }
  void addNote(){
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


