import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:wordsapp/core/api/api_response.dart';
import 'package:wordsapp/features/signIn/data/models/sign_in_response_model.dart';
import 'package:wordsapp/features/signIn/data/repositories/sign_in_repository_impl.dart';

import 'respository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInRepositoryImpl>(),
])
void main() {
  test('Autenticar usuário com sucesso', () async {
    final MockSignInRepositoryImpl mockSignInRepositoryImpl =
        MockSignInRepositoryImpl();

    final apiResponse = ApiResponse<SignInResponseModel>(
        statusCode: 200,
        message: "login realizado com sucesso",
        isError: false,
        data: const SignInResponseModel(token: "1f1d11as1a11d1f1asd1f1a1sd"));

    when(mockSignInRepositoryImpl.authenticate("email@email.com", "12345"))
        .thenAnswer((_) async => apiResponse);

    final response =
        await mockSignInRepositoryImpl.authenticate("email@email.com", "12345");

    expect(false, response.isError);
  });

  test('Falha ao tentar relizar login', () async {
    final MockSignInRepositoryImpl mockSignInRepositoryImpl =
        MockSignInRepositoryImpl();

    final apiResponse = ApiResponse<SignInResponseModel>(
        statusCode: 500,
        message: "Falha ao tentar realizar login",
        isError: true,
        data: const SignInResponseModel(token: "1f1d11as1a11d1f1asd1f1a1sd"));

    when(mockSignInRepositoryImpl.authenticate("email@email.com", "12345"))
        .thenAnswer((_) async => apiResponse);

    final response =
        await mockSignInRepositoryImpl.authenticate("email@email.com", "12345");

    expect(true, response.isError);
  });
}
