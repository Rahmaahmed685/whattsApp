class Note{

  String _title;
  String _content;
  String _image;
  String saveTitle;


  Note( this._title, this._content,this._image,[this.saveTitle='']);



  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }
}