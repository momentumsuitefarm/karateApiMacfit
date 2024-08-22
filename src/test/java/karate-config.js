function fn() {
  var config = {
      apiUrl: 'https://testapi.macfit.com.tr:8080/api'
  };

  // Loglama ayarları
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  karate.configure('report', { showLog: true, showAllSteps: true });

  // Giriş işlemi yaparak token'ı alalım
  var authResponse = karate.callSingle('classpath:examples/macfit/caller/loginCaller.feature', config);

  // Yanıtın tamamını loglayalım
  karate.log('Auth Response:', authResponse);

  // Token'ı alalım
  var token = authResponse.result && authResponse.result.accessToken ? authResponse.result.accessToken : 
              authResponse.accessToken ? authResponse.accessToken : 
              authResponse.token ? authResponse.token : 
              null;

  // Token bulunduysa global olarak ayarlayalım
  if (token) {
    config.authToken = token;
    karate.log('Logged in with token:', config.authToken);
  } else {
    karate.log('AccessToken bulunamadı:', authResponse);
    throw new Error('AccessToken yanıt içinde bulunamadı');
  }

  return config;
}
