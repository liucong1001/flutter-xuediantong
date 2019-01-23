class Contact {

      final String  avatar;
      final String className;

      Contact({this.avatar,this.className});

      factory  Contact.fromJson(Map<String,dynamic>json){
          return Contact(
            avatar:json['avatar'],
            className:json['className'],
          );
      }
  
  }

 const jsonData = [
     {'avatar':'班','className':'一年级八班'},
     {'avatar':'班','className':'三年级六班'},
 ];