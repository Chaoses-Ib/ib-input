$Env:CLASSPATH += '.\antlr-4.10.1-complete.jar;'
$Env:CLASSPATH += '..\antlr-4.10.1-complete.jar;'
Function antlr4 { java org.antlr.v4.Tool $args }
Function grun { java org.antlr.v4.gui.TestRig $args }
# antlr4 ..\..\InputLexer.g4 -o .\out\test; antlr4 ..\..\InputParser.g4 -o .\out\test; javac *.java; grun Input expr -tokens