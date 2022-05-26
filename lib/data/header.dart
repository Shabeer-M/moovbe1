import 'dart:io';

class Header {
  // application/json type simple header with authorization.
  final Map<String, String> applicationJsonHeader = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  final Map<String, String> multipartFormHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
