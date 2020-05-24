class ArrayUtils {
  static String concat(List list, String seq) {
    String ret = "";
    if (list.isEmpty) return ret;
    for (String e in list) {
      ret += e + seq;
    }
    return ret.substring(0, ret.length - seq.length);
  }

  static List filter(List origin, Function filterFun) {
    List list = [];
    for (var element in origin) {
      if (filterFun(element)) {
        list.add(element);
      }
    }
    return list;
  }

  static int findIndex(List origin, Function filterFun) {
    for (int i = 0; i < origin.length; i++) {
      if (filterFun(origin[i])) return i;
    }
    return -1;
  }
}
