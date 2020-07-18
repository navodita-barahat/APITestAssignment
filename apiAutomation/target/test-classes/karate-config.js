function() {   
  var config = {
    baseURL: 'http://ip.jsontest.com/'
  };
  
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}