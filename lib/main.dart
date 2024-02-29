void main() {
  final p1 = SharedPrefs.instance;
  final p2 = SharedPrefs.instance;
  if (p1.hashCode == p2.hashCode) {
    print("Same obj SharedPrefs");
  }

  final obj1 = LocalDB.instance;
  final obj2 = LocalDB.instance;
  if (obj1.hashCode == obj2.hashCode) {
    print("Same obj LocalDB");
  }

  final con1 = Config();
  final con2 = Config();
  if (con1.hashCode == con2.hashCode) {
    print("Same obj Config");
  }
}

class SharedPrefs {
  const SharedPrefs._();
  static get instance => const SharedPrefs._();
}

class LocalDB {
  const LocalDB._();
  static LocalDB? _instance;
  static get instance => _instance ??= const LocalDB._();
}

class Config {
  const Config._();
  static const _instance = Config._();

  factory Config() {
    return _instance;
  }
}
