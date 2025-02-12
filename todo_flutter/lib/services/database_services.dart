import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/task.dart';
import 'globals.dart';

abstract class DatabaseServices {
  static Future<Task> addTask(String title) async {
    final data = {
      "title": title,
    };
    final body = json.encode(data);
    final url = Uri.parse(baseURL + '/add');

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    debugPrint(response.body);
    final responseMap = jsonDecode(response.body);
    final task = Task.fromMap(responseMap);

    return task;
  }

  static Future<List<Task>> getTasks() async {
    final url = Uri.parse(baseURL);
    final response = await http.get(
      url,
      headers: headers,
    );
    debugPrint(response.body);
    final responseList = jsonDecode(response.body);
    final List<Task> tasks = [];
    for (Map taskMap in responseList) {
      final task = Task.fromMap(taskMap);
      tasks.add(task);
    }
    return tasks;
  }

  static Future<http.Response> updateTask(int id) async {
    final url = Uri.parse(baseURL + '/update/$id');
    final response = await http.put(
      url,
      headers: headers,
    );
    debugPrint(response.body);
    return response;
  }

  static Future<http.Response> deleteTask(int id) async {
    final url = Uri.parse(baseURL + '/delete/$id');
    final response = await http.delete(
      url,
      headers: headers,
    );
    debugPrint(response.body);
    return response;
  }
}
