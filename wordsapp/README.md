
# App Dicionário

- Aplicativo Android / iOS Flutter

## Dependências de Produção

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [intl](https://pub.dev/packages/intl)
- [bloc](https://pub.dev/packages/bloc)
- [flutter_localization](https://pub.dev/packages/flutter_localization)
- [localization](https://pub.dev/packages/localization)
- [shimmer](https://pub.dev/packages/shimmer)
- [flutter_tts](https://pub.dev/packages/flutter_tts)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [get_it](https://pub.dev/packages/get_it)
- [http](https://pub.dev/packages/get_it/http)
- [connectivity_plus](https://pub.dev/packages/connectivity_plus)

## Dependências de Desenvolvimento

- [build_runner](https://pub.dev/packages/build_runner)
- [mockito](https://pub.dev/packages/mockito)
- [test](https://pub.dev/packages/mockito)
- [flutter_lints](https://pub.dev/packages/mockito)


_Aqui voce aprende a instalar e configurar seu aplicativo._

1. Clone o repositório

   ```sh
   git clone https://github.com/williampiresse/desafio-mobile.git
   ```
2. Entrar no diretório wordsapp

   ```sh
   cd wordsapp
   ```

2. Limpe qualquer resquicio do Flutter

   ```sh
   flutter clean
   ```

3. Instale as dependências do projeto

   ```sh
   flutter pub get
   ```

4. Gerar arquivo de localização l10n

   ```sh
   flutter gen-l10n
   ```

5. Gere os arquivos anotados e build o projeto

    ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
    ```

6. Inicie o projeto

   ```sh
   flutter run
   ```
