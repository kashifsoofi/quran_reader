import 'package:flutter/material.dart';
import 'package:quran_reader/storage/chapter_storage.dart';

import '../models/chapter.dart';

class ChapterList extends StatefulWidget {
  final ChapterStorage storage;

  ChapterList({required this.storage});

  @override
  _ChapterListState createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  List<Chapter> _chapters = [];

  @override
  void initState() {
    super.initState();
    widget.storage.readChapterList().then((value) {
      setState(() {
        _chapters = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapters'),
      ),
      body: ListView.builder(
          itemCount: _chapters.length, itemBuilder: _buildItemForListView),
    );
  }

  ListTile _buildItemForListView(BuildContext context, int index) {
    return ListTile(
      title: Text(
          '${_chapters[index].nameComplex} - ${_chapters[index].nameArabic}',
          style: TextStyle(fontSize: 18)),
      subtitle:
          Text(_chapters[index].nameSimple, style: TextStyle(fontSize: 14)),
    );
  }
}
