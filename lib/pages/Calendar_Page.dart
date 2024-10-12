import 'package:flutter/material.dart';
import 'package:googleapis/classroom/v1.dart' as classroom;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

const String classroomCoursesScope = 'https://www.googleapis.com/auth/classroom.courses';
const String classroomCourseworkStudentsScope = 'https://www.googleapis.com/auth/classroom.coursework.me';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<classroom.CourseWork> _assignments = [];
  bool _isLoading = true;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    classroomCoursesScope,
    classroomCourseworkStudentsScope,
  ]);

  @override
  void initState() {
    super.initState();
    _loadAssignments();
  }

  Future<void> _loadAssignments() async {
    try {
      final assignments = await getClassroomAssignments();
      setState(() {
        _assignments = assignments;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar las tareas: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Classroom Assignments')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _assignments.isEmpty
              ? const Center(child: Text('No hay actividades disponibles'))
              : ListView.builder(
                  itemCount: _assignments.length,
                  itemBuilder: (context, index) {
                    final assignment = _assignments[index];
                    return ListTile(
                      title: Text(assignment.title ?? 'Sin título'),
                      subtitle: Text(assignment.description ?? 'Sin descripción'),
                      trailing: assignment.dueDate != null
                          ? Text('Fecha límite: ${assignment.dueDate!.day}/${assignment.dueDate!.month}/${assignment.dueDate!.year}')
                          : const Text('Sin fecha límite'),
                    );
                  },
                ),
    );
  }
}

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

  final courses = await classroomApi.courses.list();
  if (courses.courses == null || courses.courses!.isEmpty) return [];

  final courseId = courses.courses!.first.id!;
  final assignments = await classroomApi.courses.courseWork.list(courseId);
  return assignments.courseWork ?? [];
}

class _AuthenticatedClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  _AuthenticatedClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
