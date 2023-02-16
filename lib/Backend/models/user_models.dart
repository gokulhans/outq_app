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
  String start, end,storeid,serviceid,price,time;
  BookingModel(this.start, this.end,this.storeid,this.serviceid,this.price,this.time);
}
