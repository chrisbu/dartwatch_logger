#import('dart:html');
#import('dartwatch_logger_0.1.dart');


testLogger() {
  Logger.debug("this is a debug message");
  Logger.info("this is an info message");
  Logger.error("this is an error message");
  Logger.error("this error has an exception", new Exception("Help, an exception"));
}


void main() {
  //optional - if not supplied, just output to js console
  Logger.loggerElement = document.query('#logLib');
  
  //optional - LOG_LEVEL_INFO by default.
  Logger.logLevel = Logger.LOG_LEVEL_DEBUG;
  
  
  testLogger();

}
