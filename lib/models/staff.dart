class Staff {
  String? name;
  String? lastName;
  String? adress;
  String? birthday;
  String? salary;
  String? createDay;

  Staff(
      {this.name,
      this.lastName,
      this.adress,
      this.birthday,
      this.salary,
      this.createDay});

  Staff.fromJson(Map<String, dynamic> jsonStaff)
      : name = jsonStaff['name'],
        lastName = jsonStaff['lastName'],
        adress = jsonStaff['adress'],
        birthday = jsonStaff['birthday'],
        salary = jsonStaff['salary'],
        createDay = jsonStaff['createDay'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['adress'] = this.adress;
    data['birthday'] = this.birthday;
    data['salary'] = this.salary;
    data['createDay'] = this.createDay;

    return data;
  }
}
