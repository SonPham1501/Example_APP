// ignore_for_file: constant_identifier_names

class Api {
  //! For Testing only
  static const String FOR_TESTING = 'fortest';

  //class
  static const String CLASS = 'class';
  //! Class Assignment
  static const String CLASS_ASSIGNMENT = 'classassignment';
  static const String CLASS_TEST = 'classtestassignment';
  //! class member
  static const String CLASS_MEMBER = 'classmember';
  static const String REQUEST_TO_JOIN = CLASS_MEMBER + '/request';

  //! Authentication
  static const String LOGIN = 'authenticate/login';
  static const String LOGOUT = 'authenticate/logout';
  static const String REGISTER = 'authenticate/register';
  static const String REFRESH_TOKEN = 'authenticate/token';

  static const String AUTH_USER_PROFILES = 'authenticate/profiles';

  static const String AUTH_USER_PROFILE = 'authenticate/profile';
  static const String AUTH_USER_PROFILE_CREATE = 'authenticate/profile/create';
  static const String AUTH_USER_PROFILE_LINK = 'authenticate/profile/link';

  static const String FETCH_USER_LOGIN = 'authenticate/fetch';
  static const String REGISTER_CHECK_USERNAME = 'check-username';
  static const String REGISTER_VERIFY_EMAIL = 'authenticate/email/verify';
  static const String REGISTER_CHECK_EMAIL_VERIFICATION =
      'authenticate/check/emailverify';
  static const String CHANGE_COVER = 'user/profilecover';

  //!Notification
  static const String DEVICE_TOKEN = 'userdevicetoken';
  static const String NOTIFICATION = 'notification';
  static const String NOTIFICATION_BADGE = '$NOTIFICATION/getnotificationbadge';
  static const String NOTIFICATION_READ_ALL = NOTIFICATION + '/markallasread';
  static const String UPDATE_SCHOOL = 'authenticate/school/link';

  //! Subject
  static const String SUBJECT = 'subject';

  // user
  static const String GET_CURRENT_USER_PROFILE = 'user/profile';
  static const String FOLLOW = 'user/follow/';
  static const String UNFOLLOW = 'user/unfollow/';

  static const String USER_FOLLOW = 'user/following/';

  //!NewsFeed
  static const String POST = 'post';
  static const String POST_COMMENT = 'postcomment';

  //group
  static const String GROUP = 'group';
  static const String GROUP_MEMBER = 'group/member';
  static const String GROUP_MEMBER_MORDERATOR = 'group/member/moderator';
  static const String GROUP_LEAVE = 'group/member/leave';
  static const String GROUP_REQUEST = 'group/member/request';
  static const String GROUP_APPROVE = 'group/member/approve';
  static const String GROUP_RESPONSE = 'group/member/invite/response';

  //!Test
  static const String TEST = 'test';
  static const String TEST_USER = 'testuser';
  static const String TEST_COMMENT = 'testcomment';
  static const String TEST_SAVE = 'UserSaveLater';
  static const String TEST_CHALLENGE_USER = 'TestChallengeUser';
  static const String TEST_CHALLENGE_INVITATION = 'testchallengeinvitation';

  //test challenge
  static const String CREATE_TEST_CHALLENGE = "TestChallenge";

  //! Upload
  static const String UPLOAD_NEWFEED = "media/newfeed";
  static const String UPLOAD_PROFILE_IMAGE = "user/profile/picture";
  static const String MEDIA = "media";
  //game
  static const String GAME = "game";
  //! Video talk
  static const String VIDEO_TALK = "videotalk";
  static const String VIDEO_TALK_TOPIC = "videotalk/topic";
}
