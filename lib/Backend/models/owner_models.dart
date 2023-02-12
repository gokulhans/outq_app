class OwnerSignUpModel {
  String name, email, pswd;
  OwnerSignUpModel(this.name, this.email, this.pswd);
}

class StoreModel {
  String name, location, description, type;
  StoreModel(this.name, this.location, this.description, this.type);
}

class Store {

  String _id,name, location, id,description, type;


  Store(
      this._id, this.name, this.location, this.id, this.description, this.type);
}

class ServiceModel {
  String name, location, description, type;
  ServiceModel(this.name, this.location, this.description, this.type);
}

class idModel {
  String id;
  idModel(this.id);
}
