class Users {
  String name, pswd;
  Users(this.name, this.pswd);
}

class UserSignUpModel {
  String name, email, pswd, phone, location, pincode;
  UserSignUpModel(this.name, this.email, this.pswd, this.phone, this.location,
      this.pincode);
}

class UserLoginModel {
  String email, pswd;
  UserLoginModel(this.email, this.pswd);
}

class BookingModel {
  String start,
      end,
      storeid,
      serviceid,
      userid,
      price,
      date,
      servicename,
      storename,
      img,
      username;
  BookingModel(
      this.start,
      this.end,
      this.storeid,
      this.serviceid,
      this.userid,
      this.price,
      this.date,
      this.servicename,
      this.storename,
      this.img,
      this.username);
}

class GetBookingModel {
  String _id,
      start,
      end,
      storeid,
      serviceid,
      userid,
      bookingid,
      price,
      date,
      servicename,
      storename,
      img,
      username;
  GetBookingModel(
      this._id,
      this.start,
      this.end,
      this.storeid,
      this.serviceid,
      this.userid,
      this.bookingid,
      this.price,
      this.date,
      this.servicename,
      this.storename,
      this.img,
      this.username);
}

class TimeSlots {
  String start, date;
  TimeSlots(this.start, this.date);
}
