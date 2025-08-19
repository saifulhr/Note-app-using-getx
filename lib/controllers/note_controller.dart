import 'package:get/get.dart';
import 'package:note_pad_getx/models/note_model.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [];

  void addnote(NoteModel note) {
    notes.add(note);
    update();
  }

  void deletenote(int index) {
    notes.removeAt(index);
  }

  void updatenote(int index, NoteModel note) {
    notes[index] = note;
  }
}
