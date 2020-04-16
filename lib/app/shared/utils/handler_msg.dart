class HandlerMessage {
  static final String ERROR_NETWORK_REQUEST_FAILED =
      'Erro no login. Verifique sua conexção com a internet.';

  static errorGoogleLogin(String erro) {
    if (erro.contains('ERROR_NETWORK_REQUEST_FAILED')) {
      return ERROR_NETWORK_REQUEST_FAILED;
    }

    return "Erro não identificado. Tente novamente em alguns instantes.";
  }
}
