enum StatusCodeEnum {
  isReceived(code: 200),
  success(code: 201),
  dataIsNotEmpty(code: 202),
  dataIsEmpty(code: 204),
  internalServerError(code: 500),
  bodyIsEmpty(code: 203),
  emailIsAlreadyRegistered(code: 206),
  invalidEmail(code: 204),
  passwordMustBeFourCharactersLong(code: 205),
  unknown(code: 999),
  loginIsNotRegistered(code: 207),
  invalidEmailOrPassword(code: 202),
  isEmpty(code: 202),
  networkError(code: 991);

  const StatusCodeEnum({
    required this.code,
  });

  final int code;

  int get getCode => code;

  static StatusCodeEnum getById(int id) {
    for (final StatusCodeEnum status in StatusCodeEnum.values) {
      if (status.getCode == id) {
        return status;
      }
    }
    return StatusCodeEnum.unknown;
  }
}