class AppsUrl {
  static String baseUrl = "http://172.252.13.82:4000/api/v1";
  static String loginUrl = "$baseUrl/auth/sign-in";
  static String signUpUrl = "$baseUrl/auth/sign-up";
  static String verifyOtpUrl = "$baseUrl/auth/verify-account";
  static String resetPasswordUrl = "$baseUrl/auth/reset-password";
  static String resendOtpUrl = "$baseUrl/auth/resend-otp";
  static String forgetPasswordUrl = "$baseUrl/auth/forget-password";
  static String googleUrl = "$baseUrl/auth/google";

  //profile------------------------------------
  static String pFetchFollowerUrl = "$baseUrl/connection/followers";
  static String pFetchFollowingUrl = "$baseUrl/connection/followers";
  static String nearbyUserUrl = "$baseUrl/user/nearby-users";
  static String followUrl = "$baseUrl/connection/follow-user";
  static String sendRequestUrl = "$baseUrl/connection/send-request";
  static String myConnectionsUrl = "$baseUrl/connection";
}
