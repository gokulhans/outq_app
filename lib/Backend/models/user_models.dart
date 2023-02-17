class Users {
  String name, pswd;
  Users(this.name, this.pswd);
}

class UserSignUpModel {
  String name, email, pswd;
  UserSignUpModel(this.name, this.email, this.pswd);
}

class UserLoginModel {
  String email, pswd;
  UserLoginModel(this.email, this.pswd);
}
class BookingModel {
  String start, end,storeid,serviceid,userid,price,date,servicename,storename;
  BookingModel(this.start, this.end,this.storeid,this.serviceid,this.userid,this.price,this.date,this.servicename,this.storename);
}

class GetBookingModel {
  String _id,start, end,storeid,serviceid,userid,bookingid,price,date,servicename,storename;
  GetBookingModel(this._id,this.start, this.end,this.storeid,this.serviceid,this.userid,this.bookingid,this.price,this.date,this.servicename,this.storename);
}

class TimeSlots {
  String start,date;
  TimeSlots(this.start,this.date);
}
