abstract class IUserService{
  // TODO: change for normal usermodel request
  Future<void> updateFCMToken(int userId, String token);
}