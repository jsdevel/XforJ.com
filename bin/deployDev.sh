basedir="/XforJ.com"

ant -f $(dirname $PWD)/build.xml -Dparam.basedir=/XforJ.com/

google-chrome --new-window file:///XforJ.com/index.html
