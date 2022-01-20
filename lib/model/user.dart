class User {
  int? idprojectshift;
  int? projid;
  int? empid;
  int? shiftid;
  String? createdby;
  String? date;
  String? note;
  String? rate;
  int? idprojectshifts;
  int? projectid;
  String? shift;
  int? reqworkers;
  String? addedby;
  String? datetime;
  String? projectShiftscol;
  String? startdate;
  String? enddate;
  String? starttime;
  String? endtime;
  String? inspector;
  String? foreman;
  String? inspectorname;
  String? foremanname;
  String? teamlead;
  int? idprojects;
  String? projname;
  int? coid;
  String? location;
  String? vendor;
  String? creationDate;
  String? updatedDate;
  String? projdescription;
  String? contractid;

  User(
      {this.idprojectshift,
      this.projid,
      this.empid,
      this.shiftid,
      this.createdby,
      this.date,
      this.note,
      this.rate,
      this.idprojectshifts,
      this.projectid,
      this.shift,
      this.reqworkers,
      this.addedby,
      this.datetime,
      this.projectShiftscol,
      this.startdate,
      this.enddate,
      this.starttime,
      this.endtime,
      this.inspector,
      this.foreman,
      this.inspectorname,
      this.foremanname,
      this.teamlead,
      this.idprojects,
      this.projname,
      this.coid,
      this.location,
      this.vendor,
      this.creationDate,
      this.updatedDate,
      this.projdescription,
      this.contractid});

  User.fromJson(Map<String, dynamic> json) {
    idprojectshift = json['idprojectshift'];
    projid = json['projid'];
    empid = json['empid'];
    shiftid = json['shiftid'];
    createdby = json['createdby'];
    date = json['date'];
    note = json['note'];
    rate = json['rate'];
    idprojectshifts = json['idprojectshifts'];
    projectid = json['projectid'];
    shift = json['shift'];
    reqworkers = json['reqworkers'];
    addedby = json['addedby'];
    datetime = json['datetime'];
    projectShiftscol = json['project shiftscol'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    inspector = json['inspector'];
    foreman = json['foreman'];
    inspectorname = json['inspectorname'];
    foremanname = json['foremanname'];
    teamlead = json['teamlead'];
    idprojects = json['idprojects'];
    projname = json['projname'];
    coid = json['coid'];
    location = json['location'];
    vendor = json['vendor'];
    creationDate = json['creation date'];
    updatedDate = json['updated date'];
    projdescription = json['projdescription'];
    contractid = json['contractid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idprojectshift'] = this.idprojectshift;
    data['projid'] = this.projid;
    data['empid'] = this.empid;
    data['shiftid'] = this.shiftid;
    data['createdby'] = this.createdby;
    data['date'] = this.date;
    data['note'] = this.note;
    data['rate'] = this.rate;
    data['idprojectshifts'] = this.idprojectshifts;
    data['projectid'] = this.projectid;
    data['shift'] = this.shift;
    data['reqworkers'] = this.reqworkers;
    data['addedby'] = this.addedby;
    data['datetime'] = this.datetime;
    data['project shiftscol'] = this.projectShiftscol;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['starttime'] = this.starttime;
    data['endtime'] = this.endtime;
    data['inspector'] = this.inspector;
    data['foreman'] = this.foreman;
    data['inspectorname'] = this.inspectorname;
    data['foremanname'] = this.foremanname;
    data['teamlead'] = this.teamlead;
    data['idprojects'] = this.idprojects;
    data['projname'] = this.projname;
    data['coid'] = this.coid;
    data['location'] = this.location;
    data['vendor'] = this.vendor;
    data['creation date'] = this.creationDate;
    data['updated date'] = this.updatedDate;
    data['projdescription'] = this.projdescription;
    data['contractid'] = this.contractid;
    return data;
  }
}
