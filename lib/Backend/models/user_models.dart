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
  String start, end,storeid,serviceid,userid,price,date;
  BookingModel(this.start, this.end,this.storeid,this.serviceid,this.userid,this.price,this.date);
}

class GetBookingModel {
  String _id,start, end,storeid,serviceid,userid,bookingid,price,date;
  GetBookingModel(this._id,this.start, this.end,this.storeid,this.serviceid,this.userid,this.bookingid,this.price,this.date);
}
