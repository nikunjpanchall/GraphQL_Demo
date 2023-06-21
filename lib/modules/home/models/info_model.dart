class Company {
  late String name;
  late String ceo;
  late int employees;
  late int founded;
  late Headquarters headquarters;

  Company({
    required this.name,
    required this.ceo,
    required this.employees,
    required this.founded,
    required this.headquarters,
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ceo = json['ceo'];
    employees = json['employees'];
    founded = json['founded'];
    headquarters = Headquarters.fromJson(json['headquarters']);
  }
}

class Headquarters {
  late String address;
  late String city;
  late String state;

  Headquarters({
    required this.address,
    required this.city,
    required this.state,
  });

  Headquarters.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
  }
}
