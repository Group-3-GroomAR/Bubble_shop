

class Reservation{
  int _resID;
  String _salon_id;
  String customer_id;
  int _total;
  DateTime _date;
  String _start_time;
  int service_id;
  String service_name ;
  
  int _duration;
  String end_time;
   

  int get resID => _resID;

  String setDate (){
    var day = _date.day;
    var month = _date.month;
    var year = _date.year;

    var mydate  = day.toString() + "/" + month.toString() + "/" + year.toString();

    return mydate;
  }

 Reservation(this._resID,this.service_name,this._date,this._duration,this._start_time,this._total,this.end_time,this.customer_id);

  DateTime get date => _date;


}