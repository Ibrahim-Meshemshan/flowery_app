import 'package:flowery/feature/auth/data/model/login/user_model.dart';
import 'package:flowery/feature/auth/data/model/login/user_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test user model', () {
    test('test UserModel from json', () {
      // arrange
      final json = {
        '_id': '1',
        'firstName':'testFirstName',
        'lastName':'testLastName',
        'email':'testEmail@gmail.com',
        'phone':'+2012345687',
        'gender':'male',
        'role': 'user',
        'photo': 'photo',
        'wishlist': [],
        'addresses': [],
        'createdAt': DateTime.parse('2024-01-01T10:00:00.000Z').toString(),
      };
      // act
      final actual = UserModel.fromJson(json);

      // assert
      expect(actual.id, '1');
      expect(actual.firstName, 'testFirstName');
      expect(actual.lastName, 'testLastName');
      expect(actual.email, 'testEmail@gmail.com');
      expect(actual.phone, '+2012345687');
      expect(actual.gender, 'male');
      expect(actual.photo, 'photo');
      expect(actual.role, 'user');
      expect(actual.wishlist, []);
      expect(actual.addresses, []);
      expect(actual.createdAt, DateTime.parse('2024-01-01T10:00:00.000Z'));
    });
    test('should return a JSON map containing proper data', () {
      // arrange
      final user = UserModel(
        id: '123',
        firstName: 'Ibrahim',
        lastName: 'mn',
        email: 'ibrahim@test.com',
        gender: 'male',
        phone: '0000000000',
        photo: 'photo.png',
        role: 'user',
        wishlist: [],
        addresses: [],
        createdAt: DateTime.parse('2024-01-01T10:00:00.000Z'),
      );

      // act
      final json = user.toJson();

      // assert
      expect(json['_id'], '123');
      expect(json['firstName'], 'Ibrahim');
      expect(json['lastName'], 'mn');
      expect(json['email'], 'ibrahim@test.com');
      expect(json['gender'], 'male');
      expect(json['phone'], '0000000000');
      expect(json['photo'], 'photo.png');
      expect(json['role'], 'user');
      expect(json['wishlist'], []);
      expect(json['addresses'], []);
      expect(json['createdAt'], '2024-01-01T10:00:00.000Z');
    });
  },);


  group('test UserResponse model',(){
    test('should be return Map<String,dynamic>', () {
      // arrange
      final json = {
        'message': 'testMessage',
        'user': {
          '_id': '1',
          'firstName':'testFirstName',
          'lastName':'testLastName',
          'email':'testEmail@gmail.com',
          'phone':'+2012345687',
          'gender':'male',
          'role': 'user',
          'photo': 'photo',
          'wishlist': [],
          'addresses': [],
          'createdAt': DateTime.parse('2024-01-01T10:00:00.000Z').toString(),
        },
        'token': 'token'

      };
      // act
      final actual = UserResponseModel.fromJson(json);
      // assert
      expect(actual.message, 'testMessage');
      expect(actual.user.id, '1');
      expect(actual.user.firstName, 'testFirstName');
      expect(actual.user.lastName, 'testLastName');
      expect(actual.user.email, 'testEmail@gmail.com');
      expect(actual.user.phone, '+2012345687');
      expect(actual.user.gender, 'male');
      expect(actual.user.photo, 'photo');
      expect(actual.user.role, 'user');
      expect(actual.user.wishlist, []);
      expect(actual.user.addresses, []);
      expect(actual.user.createdAt, DateTime.parse('2024-01-01T10:00:00.000Z'));
      expect(actual.token, 'token');
    });
  });

}