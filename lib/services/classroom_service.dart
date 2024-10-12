import 'package:flutter/material.dart';
import 'package:googleapis/classroom/v1.dart' as classroom;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// Definimos los scopes manualmente
const String classroomCoursesScope = 'https://www.googleapis.com/auth/classroom.courses';
const String classroomCourseworkStudentsScope = 'https://www.googleapis.com/auth/classroom.coursework.me';

// Método para obtener las actividades de Google Classroom
Future<List<classroom.CourseWork>> getClassroomAssignments() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    classroomCoursesScope,
    classroomCourseworkStudentsScope,
  ]);

  final account = await googleSignIn.signIn();
  if (account == null) return [];

  final authHeaders = await account.authHeaders;
  final client = _AuthenticatedClient(authHeaders);
  final classroomApi = classroom.ClassroomApi(client);

  final courses = await classroomApi.courses.list(); // Obtener cursos
  if (courses.courses == null || courses.courses!.isEmpty) return [];

  final courseId = courses.courses!.first.id!; // Usamos el primer curso como ejemplo
  final assignments = await classroomApi.courses.courseWork.list(courseId);
  return assignments.courseWork ?? [];
}

// Clase para manejar el cliente autenticado
class _AuthenticatedClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  _AuthenticatedClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
