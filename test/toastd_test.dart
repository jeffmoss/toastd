import 'dart:html';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

import 'package:toastd/toastd.dart' as toastd;

void main() {
  useHtmlConfiguration();

  test('defaults', () =>
    expect(toastd.Toast.defaults['toastClass'], equals('toast'))
  );

  test('Toast.info', () =>
    expect(() => new toastd.Toast.info('Test', 'Info'), returnsNormally)
  );

  test('Toast.success', () =>
    expect(() => new toastd.Toast.success('Test', 'Success'), returnsNormally)
  );

  test('Toast.warning', () =>
    expect(() => new toastd.Toast.warning('Test', 'Warning'), returnsNormally)
  );

  test('Toast.error', () =>
    expect(() => new toastd.Toast.error('Test', 'Error'), returnsNormally)
  );

  test('Toast#fade', () {
    expect(() => new toastd.Toast('Hello World', 'Blah', {}).fade(), returnsNormally);
  });


}