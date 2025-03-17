import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Student and StudentManager classes are above this code

void main() async {
  // Create a StudentManager instance
  final studentManager = StudentManager();

  // Load any existing students
  await studentManager.loadStudents();
  print('Initial students:');
  _printStudents(studentManager.students);

  // Add some hard-coded students
  print('\nAdding students...');
  await studentManager.addStudent(
    Student(id: 101, name: 'John Doe', grade: 85.5),
  );
  await studentManager.addStudent(
    Student(id: 102, name: 'Jane Smith', grade: 92.0),
  );
  await studentManager.addStudent(
    Student(id: 103, name: 'Bob Johnson', grade: 78.5),
  );

  // Print the updated list
  print('\nAfter adding students:');
  _printStudents(studentManager.students);

  // Remove a student
  print('\nRemoving student with ID 102...');
  await studentManager.removeStudent(102);

  // Print the final list
  print('\nFinal student list:');
  _printStudents(studentManager.students);

  // Show file location
  final file = await studentManager._localFile;
  print('\nStudents saved to: ${file.path}');
}

// Helper function to print students
void _printStudents(List<Student> students) {
  if (students.isEmpty) {
    print('  No students found.');
    return;
  }

  for (var student in students) {
    print(
      '  ID: ${student.id}, Name: ${student.name}, Grade: ${student.grade}',
    );
  }
}

class Student {
  final int id;
  final String name;
  final double grade;

  Student({required this.id, required this.name, required this.grade});

  // Convert a Student object to a Map
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'grade': grade};

  // Create a Student from a Map
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(id: json['id'], name: json['name'], grade: json['grade']);
  }
}

class StudentManager {
  List<Student> _students = [];
  final String _fileName = 'students.json';

  // Get list of students
  List<Student> get students => _students;

  // Get the local file path
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  // Load students from file
  Future<void> loadStudents() async {
    try {
      final file = await _localFile;
      // Check if file exists
      if (await file.exists()) {
        // Read the file
        final contents = await file.readAsString();

        // Parse the JSON string
        final List<dynamic> jsonData = jsonDecode(contents);

        // Convert each item to a Student object
        _students = jsonData.map((item) => Student.fromJson(item)).toList();
      }
    } catch (e) {
      // If encountering an error, return an empty list
      _students = [];
    }
  }

  // Save students to file
  Future<void> saveStudents() async {
    final file = await _localFile;

    // Convert students to a JSON-encodable list
    final jsonData = _students.map((student) => student.toJson()).toList();

    // Write the JSON to the file
    await file.writeAsString(jsonEncode(jsonData));
  }

  // Add a new student
  Future<void> addStudent(Student student) async {
    _students.add(student);
    await saveStudents();
  }

  // Remove a student by ID
  Future<void> removeStudent(int id) async {
    _students.removeWhere((student) => student.id == id);
    await saveStudents();
  }

  // Get a student by ID
  Student? getStudentById(int id) {
    try {
      return _students.firstWhere((student) => student.id == id);
    } catch (_) {
      return null;
    }
  }
}
