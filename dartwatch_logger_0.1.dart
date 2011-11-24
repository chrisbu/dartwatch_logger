#library("dartwatch:logger:0.1");

#import("dart:html");

class Logger {
  
  static final LOG_LEVEL_INFO = "INFO";
  static final LOG_LEVEL_DEBUG = "DEBUG";
  static final LOG_LEVEL_ERROR = "ERROR";
  
  /** It is valid for logger element to be null.  
  * If the loggerElement is null, then the output will go to the console only.
  * If logger element is not null, then the output will go to both the 
  * console and the logger element in the UI.
  */
  static PreElement loggerElement = null;
  
  /** The default log level.  
  */
  static var logLevel = "INFO";

  /**
  * Output logging at the debug level.
  */
  static void debug(var o, [Exception ex]) {
    if (logLevel == LOG_LEVEL_DEBUG) {
        String message = _buildMessage(LOG_LEVEL_DEBUG, o, ex);
        window.console.debug(message);
        _outputToUi(message); 
      }
  }
  
  /**
  * Output logging at the info log level
  */
  static void info(var o, [Exception ex]) {
    if (logLevel == LOG_LEVEL_INFO || 
        logLevel == LOG_LEVEL_DEBUG) {
        String message = _buildMessage(LOG_LEVEL_INFO, o, ex);
        window.console.info(message);
        _outputToUi(message);
    }
  }
  
  /**
  * Output logging at the error level
  */ 
  static void error(var o, [Exception ex]) {
    if (logLevel == LOG_LEVEL_DEBUG ||
        logLevel == LOG_LEVEL_INFO || 
        logLevel == LOG_LEVEL_ERROR) {
        
      //print("in error");
      String message = _buildMessage(LOG_LEVEL_ERROR, o, ex);
      window.console.error(message);
      _outputToUi(message); 
    }
  }
  
 
  /**
  * Build the message, calling toString on the o passed in, optionally adding 
    in an exception.
  */
  static String _buildMessage(String logLevel, var o, [Exception ex]) {
    if (ex != null) {
      return new Date.now().toString() + " [" + logLevel + "] - " + o.toString() + " - [" + ex.toString() + "]";
    }
    else {
      return new Date.now().toString() + " [" + logLevel + "] - " + o.toString();  
    }
    
  }
  

  /**
  * If the loggerElement is not null, then append the message to the innerHtml
  * of the logger element.
  */ 
  static _outputToUi(String message) {
    if (loggerElement != null) {
      loggerElement.innerHTML += "<br />" + message;
    }
  }
  
  
}
