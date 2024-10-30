import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  test('Login with email and password', () async {
  // Set up a test user
  const email = 'test@example.com';
  const password = 'password123';

  // Call the login function
  await login(email, password);

  // Verify that the user is logged in
  expect(FirebaseAuth.instance.currentUser, isNotNull);
  expect(FirebaseAuth.instance.currentUser!.email, email);
});
}

login(String email, String password) {
}