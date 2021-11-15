import 'package:dio/dio.dart';
import 'package:flutter_movies/core/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  MockDio dio = MockDio();
  ApiClient apiClient = ApiClient(dio);

  test('should get from dio and return response', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        data: {'data': 'data'},
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final response = await apiClient.get(1.toString());
    expect(response.data, {'data': 'data'} );
  });
}
