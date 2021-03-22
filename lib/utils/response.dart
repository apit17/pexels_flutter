enum ResponseState {
  Loading,
  Completed,
  Error
}

class Response<ResultType> {
  ResponseState state;
  ResultType data;
  String exception;

  Response({this.state, this.data, this.exception});

  static Response<ResultType> loading<ResultType>() {
    return Response(state: ResponseState.Loading);
  }

  static Response<ResultType> completed<ResultType>(ResultType data) {
    return Response(state: ResponseState.Completed, data: data);
  }

  static Response<ResultType> error<ResultType>(String exception) {
    return Response(state: ResponseState.Error, exception: exception);
  }
}