import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_reader/models/chapter.dart';

class ChapterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid || Platform.isIOS) {
      return directory.path;
    }

    var readerDirectory = Directory(directory.path + '/quran_reader');
    var isThere = readerDirectory.existsSync();
    if (!isThere) {
      readerDirectory.createSync();
    }

    return readerDirectory.path;
  }

  Future<File> get _localListFile async {
    final path = await _localPath;
    return File('$path/chapter_list.json');
  }

  Future<List<Chapter>> readChapterList() async {
    try {
      final file = await _localListFile;

      // Read the file
      String contents = await file.readAsString();

      // Use the compute function to run parseChapterList in a separate isolate.
      return compute(parseChapterList, contents);
    } catch (e) {
      // If encountering an error, return null
      return [];
    }
  }

  Future<File> writeChapterList(String content) async {
    final file = await _localListFile;

    // Write the file
    return file.writeAsString(content);
  }
}

List<Chapter> parseChapterList(String content) {
  var chaptersJson = jsonDecode(content)['chapters'] as List;

  return chaptersJson.map((json) => Chapter.fromJson(json)).toList();
}
