import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ApiTest.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiClient {
  factory ApiClient(Dio dio){
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _ApiClient(dio, baseUrl: "https://jsonplaceholder.typicode.com");
  }

  //Dynamic headers
//  @GET("/posts")
//  Future<List<Post>> getPosts(@Header("Content-Type") String contentType );

  @GET("/posts/{id}")
  Future<Post> getPostFromId(@Path("id") int postId);

  @GET("/posts/{id}")
  Future<String> getPostFromIdString(@Path("id") int postId);

//  @GET("/comments")
//  @Headers(<String, dynamic>{ //Static header
//    "Content-Type" : "application/json",
//    "Custom-Header" : "Your header"
//  })
//  Future<List<Comment>> getAllComments();
//
//  @GET("/posts/{id}")
//  Future<Post> getPostFromId(@Path("id") int postId);
//
//  @GET("/comments?postId={id}")
//  Future<Comment> getCommentFromPostId(@Path("id") int postId);
//  @GET("/comments")
//  Future<Comment> getCommentFromPostIdWithQuery(@Query("postId") int postId); //This yields to "/comments?postId=postId
//  @DELETE("/posts/{id}")
//  Future<void> deletePost(@Path("id") int postId);
//  @POST("/posts")
//  Future<Post> createPost(@Body() Post post);
}

@JsonSerializable()
class Post {
//  int userid;
//  int name;
  String title;
//  String body;

  //Post({this.userid, this.name, this.title, this.body});
  Post({this.title});
//  Post({this.name});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
