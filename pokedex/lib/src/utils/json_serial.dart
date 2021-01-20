abstract class JsonSerial<T> {
  T mapToModel(Map<String, dynamic> map);
  Map<String, dynamic> mapFromModel(T model);

  List<T> mapToListModel(List<dynamic> list) => list == null
      ? []
      : list.map((item) => mapToModel(item as Map<String, dynamic>)).toList();

  List<Map<String, dynamic>> mapFromListModel(List<T> list) =>
      list == null ? [] : list.map(mapFromModel).toList();
}
