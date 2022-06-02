class PageRequestModel {
  var page = 0;
  var addNum = 0;
  var size = 20;
  var isLast = false;
  var isLoading = false;
  var isEmpty = false;

  Map<String, dynamic> getRequestParam() {
    return {'page': page, 'size': size};
  }

  void setResult(List<dynamic> result) {
    if (result.length % size != 0 || result.isEmpty) isLast = true;
    if (page == 0 && result.isEmpty) isEmpty = true;
    isLoading = false;
    addNum = result.length;
    page++;
  }

  void setRefresh() {
    page = 0;
    isLast = false;
    isLoading = false;
  }
}
