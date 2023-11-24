import 'package:flutter_test/flutter_test.dart';
import 'package:karteikarten/core/validators/password_validator.dart';

void main() {
  test('teste auf leren String', () {
    var result = validatePassword("");
    expect(result, 'please enter a valid passwort');
  });

  test('teste auf zu kurze eingabe ', () {
    var result = validatePassword("12345");
    expect(result, 'short password');
  });

  test('Teste auf korrekte eingabe', () {
    var result = validatePassword("123456");
    expect(result, null);
  });
}
