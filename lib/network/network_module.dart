import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://rickandmortyapi.com/api/';

  @Named('PrettyLogger')
  Interceptor providePrettyLogger() => PrettyDioLogger();

  @singleton
  Dio providerDio(@Named('BaseUrl') String baseurl,
          @Named('PrettyLogger') Interceptor prettyLogger) =>
      Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.add(prettyLogger);
}
