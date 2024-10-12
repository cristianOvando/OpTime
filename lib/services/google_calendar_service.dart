import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:http/http.dart' as http;

class GoogleCalendarService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      calendar.CalendarApi.calendarScope, // Permiso para acceder a Google Calendar
      'https://www.googleapis.com/auth/classroom.coursework.me', // Permiso para Classroom
    ],
  );

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print('Error al iniciar sesión: $error');
      return null;
    }
  }

  Future<calendar.CalendarApi?> getCalendarApi() async {
    final account = await _googleSignIn.signIn();
    if (account == null) return null;

    final authHeaders = await account.authHeaders;
    final client = _AuthenticatedClient(authHeaders);
    return calendar.CalendarApi(client);
  }

  // Obtener eventos del calendario
  Future<List<calendar.Event>> getCalendarEvents() async {
    final api = await getCalendarApi();
    if (api == null) return [];

    final events = await api.events.list('primary', maxResults: 10);
    return events.items ?? [];
  }
}

// Cliente autenticado para hacer peticiones con los headers correctos
class _AuthenticatedClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  _AuthenticatedClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
