

class Reservation{
  int _resID;
  String _salon_id;
  String customer_id;
  String customer_name;
  int _total;
  DateTime _date;
  String start_time;
  int service_id;
  String service_name ;
  int Status;
  int _duration;
  String end_time;
  int refNumber;



  int get resID => _resID;

  int setRef (var id){
    refNumber =(id *99) -  60;

    return refNumber;
  }

  String setDate (){
    var day = _date.day;
    var month = _date.month;
    var year = _date.year;

    var mydate  = day.toString() + "/" + month.toString() + "/" + year.toString();

    return mydate;
  }

 Reservation(this._resID,this.service_name,this._date,this._duration,this.start_time,this._total,this.end_time,this.customer_id,this.customer_name,this.Status);

  DateTime get date => _date;


}