class UserDetails {
  final String id;
  final String email;
  final String status;
  final String userRoleId;
  final String isDeleted;
  final String userFirstName;
  final String userLastName;
  final String userUniqueId;
  final String userProfilePic;
  final String profilePicUrl;

  UserDetails(
    this.id,
    this.email,
    this.status,
    this.userRoleId,
    this.isDeleted,
    this.userFirstName,
    this.userLastName,
    this.userUniqueId,
    this.userProfilePic,
    this.profilePicUrl,
  );

  UserDetails.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        status = json["status"],
        userRoleId = json["user_role_id"],
        isDeleted = json["isDeleted"],
        userFirstName = json["user_first_name"],
        userLastName = json["user_last_name"],
        userUniqueId = json["user_unique_id"],
        userProfilePic = json["user_profile_pic"],
        profilePicUrl = json["profile_pic_url"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'status': status,
        'user_role_id': userRoleId,
        'isDeleted': isDeleted,
        'user_first_name': userFirstName,
        'user_last_name': userLastName,
        'user_unique_id': userUniqueId,
        'user_profile_pic': userProfilePic,
        'profile_pic_url': profilePicUrl,
      };
}
