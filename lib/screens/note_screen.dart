import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad_getx/controllers/note_controller.dart';
import 'package:note_pad_getx/models/note_model.dart';
import 'package:note_pad_getx/themes/all_colors.dart';
import 'package:note_pad_getx/themes/all_icons.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({super.key});

  final NoteController controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note',
          style: TextStyle(
            color: AllColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AllColors.brownColor,
        toolbarHeight: 40,
      ),
      body: SizedBox(
        width: Get.width,
        child: GetBuilder<NoteController>(
          builder: (_) {
            return controller.notes.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(AllIcons.EmptyIcon),
                      SizedBox(height: 5),
                      Text('Notes Empty'),
                    ],
                  )
                : ListView.builder(
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      NoteModel note = controller.notes[index];
                      return ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.description),
                        trailing: SizedBox(
                          width: 50,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(AllIcons.editIcon),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  AllIcons.deleteIcon,
                                  color: AllColors.redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
