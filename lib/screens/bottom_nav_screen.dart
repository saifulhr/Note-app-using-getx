import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:note_pad_getx/controllers/note_controller.dart';
import 'package:note_pad_getx/models/note_model.dart';
import 'package:note_pad_getx/screens/favourite_screen.dart';
import 'package:note_pad_getx/screens/note_screen.dart';
import 'package:note_pad_getx/themes/all_colors.dart';
import 'package:note_pad_getx/themes/all_icons.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  NoteController controller = Get.put(NoteController());
  final TextEditingController _titleClt = TextEditingController();
  final TextEditingController _descriptionClt = TextEditingController();
  final List<Widget> _screens = [NoteScreen(), FavouriteScreen()];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showalartdialog(context);
        },
        backgroundColor: AllColors.brownColor,
        mini: true,
        child: Icon(AllIcons.addIcon, color: AllColors.whiteColor),
      ),
      bottomNavigationBar: GNav(
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 200),
        gap: 8,
        color: AllColors.whiteColor.withOpacity(.7),
        activeColor: AllColors.whiteColor,
        iconSize: 24,
        tabBackgroundColor: Colors.transparent,
        backgroundColor: AllColors.brownColor,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        selectedIndex: _selectedIndex,
        onTabChange: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        tabs: [
          GButton(icon: AllIcons.noteIcon, text: 'Note'),
          GButton(icon: AllIcons.favouriteIcon, text: 'Favourite'),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }

  void _showalartdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text(
                'Create a note',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleClt,
                    decoration: InputDecoration(
                      hintText: 'Enter a title',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.brown, width: 1.2),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _descriptionClt,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter a description',
                      hintStyle: TextStyle(fontSize: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.brown, width: 1.2),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AllColors.redColor,
                    foregroundColor: AllColors.whiteColor,
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.addnote(
                      NoteModel(
                        _titleClt.text,
                        _descriptionClt.text,
                        '20 june 7:30am',
                      ),
                    );
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AllColors.brownColor,
                    foregroundColor: AllColors.whiteColor,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
