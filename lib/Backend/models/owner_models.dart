class OwnerSignUpModel {
  String name, email, pswd;
  OwnerSignUpModel(this.name, this.email, this.pswd);
}

class OwnerLoginModel {
  String email, pswd;
  OwnerLoginModel(this.email, this.pswd);
}

class StoreModel {
  String name, location, description, type, img;
  StoreModel(this.name, this.location, this.description, this.type, this.img);
}

class Store {
  String _id, name, location, id, description, type, img;
  Store(this._id, this.name, this.location, this.id, this.description,
      this.type, this.img);
}

class ServiceModel {
  String name, description, price, ogprice, img, ownerid, storeid;

  ServiceModel(this.name, this.description, this.price, this.ogprice, this.img,
      this.ownerid, this.storeid);
}

class GetServiceModel {
  String _id, name, description, price ,ogprice, img, ownerid, storeid, id;
  GetServiceModel(this._id, this.name, this.description, this.price,
      this.ogprice, this.img, this.ownerid, this.storeid, this.id);
}

class idModel {
  String id;
  idModel(this.id);
}
