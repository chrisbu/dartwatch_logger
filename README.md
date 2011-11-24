# dartwatch logger.


Allows logging to the javascript console and also to a <pre> pane on the UI.

Basic usage:

\#import("http://dartwatch.com/libraries/logger/dartwatch_logger_0.1.dart")


Optional:
Include in your html a pre tag with id="logLib" (or some other id)
wherever you would like your log messages to be output.
If you don't include this, then logging just goes to the console.



main() {
  //optional if not supplied, just output to js console
  Logger.loggerElement = document.query('#logLib'); //reference the pre tag

  //optional - LOG_LEVEL_INFO by default
  Logger.logLevel = Logger.LOG_LEVEL_DEBUG;

  
  Logger.debug("a debug message");
  Logger.info("an info message");
  Logger.error("an error message");

  //this also works for debug and info logging.
  Logger.error("an error message with exception", new Exception("some ex"));

}
