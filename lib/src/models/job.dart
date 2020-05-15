class Job {
  int _alljobs;
  String _jobid;
  String _applyurl;
  String _position;
  String _datedeleted;
  String _companyurl;
  String _companyname;
  String _companytwitter;
  String _sourcename;
  String _sourceurl;
  String _companyid;
  String _sourceid;
  String _dateaddedUnixtime;
  String _dateadded;
  String _description;
  String _sponsored;
  String _custom;
  List<String> _tags;
  String _paid;
  String _postionFilled;
  String _jobType;
  String _payStatus;
  String _companylogo;
  String _logo;
  int _id;

  Job(
      {int alljobs,
      String jobid,
      String applyurl,
      String position,
      String datedeleted,
      String companyurl,
      String companyname,
      String companytwitter,
      String sourcename,
      String sourceurl,
      String companyid,
      String sourceid,
      String dateaddedUnixtime,
      String dateadded,
      String description,
      String sponsored,
      String custom,
      List<String> tags,
      String paid,
      String postionFilled,
      String jobType,
      String payStatus,
      String companylogo,
      String logo,
      int id}) {
    this._alljobs = alljobs;
    this._jobid = jobid;
    this._applyurl = applyurl;
    this._position = position;
    this._datedeleted = datedeleted;
    this._companyurl = companyurl;
    this._companyname = companyname;
    this._companytwitter = companytwitter;
    this._sourcename = sourcename;
    this._sourceurl = sourceurl;
    this._companyid = companyid;
    this._sourceid = sourceid;
    this._dateaddedUnixtime = dateaddedUnixtime;
    this._dateadded = dateadded;
    this._description = description;
    this._sponsored = sponsored;
    this._custom = custom;
    this._tags = tags;
    this._paid = paid;
    this._postionFilled = postionFilled;
    this._jobType = jobType;
    this._payStatus = payStatus;
    this._companylogo = companylogo;
    this._logo = logo;
    this._id = id;
  }

  int get alljobs => _alljobs;
  set alljobs(int alljobs) => _alljobs = alljobs;
  String get jobid => _jobid;
  set jobid(String jobid) => _jobid = jobid;
  String get applyurl => _applyurl;
  set applyurl(String applyurl) => _applyurl = applyurl;
  String get position => _position;
  set position(String position) => _position = position;
  String get datedeleted => _datedeleted;
  set datedeleted(String datedeleted) => _datedeleted = datedeleted;
  String get companyurl => _companyurl;
  set companyurl(String companyurl) => _companyurl = companyurl;
  String get companyname => _companyname;
  set companyname(String companyname) => _companyname = companyname;
  String get companytwitter => _companytwitter;
  set companytwitter(String companytwitter) => _companytwitter = companytwitter;
  String get sourcename => _sourcename;
  set sourcename(String sourcename) => _sourcename = sourcename;
  String get sourceurl => _sourceurl;
  set sourceurl(String sourceurl) => _sourceurl = sourceurl;
  String get companyid => _companyid;
  set companyid(String companyid) => _companyid = companyid;
  String get sourceid => _sourceid;
  set sourceid(String sourceid) => _sourceid = sourceid;
  String get dateaddedUnixtime => _dateaddedUnixtime;
  set dateaddedUnixtime(String dateaddedUnixtime) =>
      _dateaddedUnixtime = dateaddedUnixtime;
  String get dateadded => _dateadded;
  set dateadded(String dateadded) => _dateadded = dateadded;
  String get description => _description;
  set description(String description) => _description = description;
  String get sponsored => _sponsored;
  set sponsored(String sponsored) => _sponsored = sponsored;
  String get custom => _custom;
  set custom(String custom) => _custom = custom;
  List<String> get tags => _tags;
  set tags(List<String> tags) => _tags = tags;
  String get paid => _paid;
  set paid(String paid) => _paid = paid;
  String get postionFilled => _postionFilled;
  set postionFilled(String postionFilled) => _postionFilled = postionFilled;
  String get jobType => _jobType;
  set jobType(String jobType) => _jobType = jobType;
  String get payStatus => _payStatus;
  set payStatus(String payStatus) => _payStatus = payStatus;
  String get companylogo => _companylogo;
  set companylogo(String companylogo) => _companylogo = companylogo;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;
  int get id => _id;
  set id(int id) => _id = id;

  Job.fromJson(Map<String, dynamic> json) {
    _alljobs = json['alljobs'];
    _jobid = json['jobid'];
    _applyurl = json['applyurl'];
    _position = json['position'];
    _datedeleted = json['datedeleted'];
    _companyurl = json['companyurl'];
    _companyname = json['companyname'];
    _companytwitter = json['companytwitter'];
    _sourcename = json['sourcename'];
    _sourceurl = json['sourceurl'];
    _companyid = json['companyid'];
    _sourceid = json['sourceid'];
    _dateaddedUnixtime = json['dateadded_unixtime'];
    _dateadded = json['dateadded'];
    _description = json['description'];
    _sponsored = json['sponsored'];
    _custom = json['custom'];
    _tags = json['tags'].cast<String>();
    _paid = json['paid'];
    _postionFilled = json['postionFilled'];
    _jobType = json['job_type'];
    _payStatus = json['pay_status'];
    _companylogo = json['companylogo'];
    _logo = json['logo'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alljobs'] = this._alljobs;
    data['jobid'] = this._jobid;
    data['applyurl'] = this._applyurl;
    data['position'] = this._position;
    data['datedeleted'] = this._datedeleted;
    data['companyurl'] = this._companyurl;
    data['companyname'] = this._companyname;
    data['companytwitter'] = this._companytwitter;
    data['sourcename'] = this._sourcename;
    data['sourceurl'] = this._sourceurl;
    data['companyid'] = this._companyid;
    data['sourceid'] = this._sourceid;
    data['dateadded_unixtime'] = this._dateaddedUnixtime;
    data['dateadded'] = this._dateadded;
    data['description'] = this._description;
    data['sponsored'] = this._sponsored;
    data['custom'] = this._custom;
    data['tags'] = this._tags;
    data['paid'] = this._paid;
    data['postionFilled'] = this._postionFilled;
    data['job_type'] = this._jobType;
    data['pay_status'] = this._payStatus;
    data['companylogo'] = this._companylogo;
    data['logo'] = this._logo;
    data['id'] = this._id;
    return data;
  }
}
