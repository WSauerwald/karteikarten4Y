

abstract class AuthFailure{}

class ServerFailure extends AuthFailure{}

class EmailAlreadyInUseFailure extends AuthFailure{}

class InvalidEmailAndPasswordFailure extends AuthFailure{}