class DataHandle<T> {
  T? data;
  String result;
  T? temp;
  int? filterPage = 1;
  int currentPage = 1;
  int pageCount = 0;

  DataHandle({
    this.data,
    required this.result,
    this.temp,
    this.filterPage,
  });
}

class ResultHandler {
  bool? isSuccessful;
  String? message;

  ResultHandler({
    this.isSuccessful,
    this.message,
  });
}