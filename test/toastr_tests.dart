library tests;

import 'dart:html';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

import 'package:toastr/toastr.dart' as toastr;

void main() {
  useHtmlConfiguration();

  test('defaults', () =>
    expect(toastr.defaults['toastClass'], equals('toast'))
  );

  test('Toast.info', () =>
    expect(() => new toastr.Toast.info('Hello World', 'Blah'), returnsNormally)
  );

  test('Toast#fade', () {
    expect(() => new toastr.Toast.info('Hello World', 'Blah').fade(), returnsNormally);
  });


}