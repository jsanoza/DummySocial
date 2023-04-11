import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/utils/constants.dart';

void main() {
  group('EndPoints', () {
    test('baseUrl should be a string', () {
      expect(EndPoints.baseUrl, isA<String>());
    });

    test('login should be a string', () {
      expect(EndPoints.login, isA<String>());
    });

    test('user should be a string', () {
      expect(EndPoints.user, isA<String>());
    });

    test('timeout should be a Duration', () {
      expect(EndPoints.timeout, isA<Duration>());
    });

    test('token should be a string', () {
      expect(EndPoints.token, isA<String>());
    });

    group('LoadDataState', () {
      test('initialize should be a LoadDataState', () {
        expect(LoadDataState.initialize, isA<LoadDataState>());
      });

      test('loading should be a LoadDataState', () {
        expect(LoadDataState.loading, isA<LoadDataState>());
      });

      test('loaded should be a LoadDataState', () {
        expect(LoadDataState.loaded, isA<LoadDataState>());
      });

      test('error should be a LoadDataState', () {
        expect(LoadDataState.error, isA<LoadDataState>());
      });

      test('timeout should be a LoadDataState', () {
        expect(LoadDataState.timeout, isA<LoadDataState>());
      });

      test('unknownerror should be a LoadDataState', () {
        expect(LoadDataState.unknownerror, isA<LoadDataState>());
      });
    });
  });
}