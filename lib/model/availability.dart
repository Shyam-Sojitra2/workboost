class Availability {
  int? idworkeravail;
  int? empid;
  String? date;
  String? start;
  String? end;
  int? credtedby;
  String? modified;

  Availability(
      {this.idworkeravail,
      this.empid,
      this.date,
      this.start,
      this.end,
      this.credtedby,
      this.modified});

  Availability.fromJson(Map<String, dynamic> json) {
    idworkeravail = json['idworkeravail'];
    empid = json['empid'];
    date = json['date'];
    start = json['start'];
    end = json['end'];
    credtedby = json['credtedby'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idworkeravail'] = this.idworkeravail;
    data['empid'] = this.empid;
    data['date'] = this.date;
    data['start'] = this.start;
    data['end'] = this.end;
    data['credtedby'] = this.credtedby;
    data['modified'] = this.modified;
    return data;
  }
}
