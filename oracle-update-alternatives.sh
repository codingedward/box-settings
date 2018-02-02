
export JDK_INSTALL=/opt/jdk1.8.0_112
#export JDK_INSTALL=/opt/jdk1.7.0_25
#export JDK_INSTALL=/opt/jdk1.6.0_45


#JDK 6 and above

sudo update-alternatives --install /usr/bin/appletviewer appletviewer $JDK_INSTALL/bin/appletviewer 1
sudo update-alternatives --install /usr/bin/extcheck extcheck $JDK_INSTALL/bin/extcheck 1
sudo update-alternatives --install /usr/bin/idlj idlj $JDK_INSTALL/bin/idlj 1
sudo update-alternatives --install /usr/bin/jar jar $JDK_INSTALL/bin/jar 1
sudo update-alternatives --install /usr/bin/jarsigner jarsigner $JDK_INSTALL/bin/jarsigner 1
sudo update-alternatives --install /usr/bin/java java $JDK_INSTALL/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac $JDK_INSTALL/bin/javac 1
sudo update-alternatives --install /usr/bin/javadoc javadoc $JDK_INSTALL/bin/javadoc 1
sudo update-alternatives --install /usr/bin/javah javah $JDK_INSTALL/bin/javah 1
sudo update-alternatives --install /usr/bin/javap javap $JDK_INSTALL/bin/javap 1
sudo update-alternatives --install /usr/bin/javaws javaws $JDK_INSTALL/bin/javaws 1
sudo update-alternatives --install /usr/bin/jconsole jconsole $JDK_INSTALL/bin/jconsole 1
sudo update-alternatives --install /usr/bin/jdb jdb $JDK_INSTALL/bin/jdb 1
sudo update-alternatives --install /usr/bin/jhat jhat $JDK_INSTALL/bin/jhat 1
sudo update-alternatives --install /usr/bin/jinfo jinfo $JDK_INSTALL/bin/jinfo 1
sudo update-alternatives --install /usr/bin/jmap jmap $JDK_INSTALL/bin/jmap 1
sudo update-alternatives --install /usr/bin/jps jps $JDK_INSTALL/bin/jps 1
sudo update-alternatives --install /usr/bin/jrunscript jrunscript $JDK_INSTALL/bin/jrunscript 1
sudo update-alternatives --install /usr/bin/jsadebugd jsadebugd $JDK_INSTALL/bin/jsadebugd 1
sudo update-alternatives --install /usr/bin/jstack jstack $JDK_INSTALL/bin/jstack 1
sudo update-alternatives --install /usr/bin/jstat jstat $JDK_INSTALL/bin/jstat 1
sudo update-alternatives --install /usr/bin/jstatd jstatd $JDK_INSTALL/bin/jstatd 1
sudo update-alternatives --install /usr/bin/keytool keytool $JDK_INSTALL/bin/keytool 1
sudo update-alternatives --install /usr/bin/native2ascii native2ascii $JDK_INSTALL/bin/native2ascii 1
sudo update-alternatives --install /usr/bin/orbd orbd $JDK_INSTALL/bin/orbd 1
sudo update-alternatives --install /usr/bin/pack200 pack200 $JDK_INSTALL/bin/pack200 1
sudo update-alternatives --install /usr/bin/policytool policytool $JDK_INSTALL/bin/policytool 1
sudo update-alternatives --install /usr/bin/rmic rmic $JDK_INSTALL/bin/rmic 1
sudo update-alternatives --install /usr/bin/rmid rmid $JDK_INSTALL/bin/rmid 1
sudo update-alternatives --install /usr/bin/rmiregistry rmiregistry $JDK_INSTALL/bin/rmiregistry 1
sudo update-alternatives --install /usr/bin/schemagen schemagen $JDK_INSTALL/bin/schemagen 1
sudo update-alternatives --install /usr/bin/serialver serialver $JDK_INSTALL/bin/serialver 1
sudo update-alternatives --install /usr/bin/servertool servertool $JDK_INSTALL/bin/servertool 1
sudo update-alternatives --install /usr/bin/tnameserv tnameserv $JDK_INSTALL/bin/tnameserv 1
sudo update-alternatives --install /usr/bin/unpack200 unpack200 $JDK_INSTALL/bin/unpack200 1
sudo update-alternatives --install /usr/bin/wsgen wsgen $JDK_INSTALL/bin/wsgen 1
sudo update-alternatives --install /usr/bin/wsimport wsimport $JDK_INSTALL/bin/wsimport 1
sudo update-alternatives --install /usr/bin/xjc xjc $JDK_INSTALL/bin/xjc 1

sudo update-alternatives --set appletviewer $JDK_INSTALL/bin/appletviewer
sudo update-alternatives --set extcheck $JDK_INSTALL/bin/extcheck
sudo update-alternatives --set idlj $JDK_INSTALL/bin/idlj
sudo update-alternatives --set jar $JDK_INSTALL/bin/jar
sudo update-alternatives --set jarsigner $JDK_INSTALL/bin/jarsigner
sudo update-alternatives --set java $JDK_INSTALL/bin/java
sudo update-alternatives --set javac $JDK_INSTALL/bin/javac
sudo update-alternatives --set javadoc $JDK_INSTALL/bin/javadoc
sudo update-alternatives --set javah $JDK_INSTALL/bin/javah
sudo update-alternatives --set javap $JDK_INSTALL/bin/javap
sudo update-alternatives --set javaws $JDK_INSTALL/bin/javaws
sudo update-alternatives --set jconsole $JDK_INSTALL/bin/jconsole
sudo update-alternatives --set jdb $JDK_INSTALL/bin/jdb
sudo update-alternatives --set jhat $JDK_INSTALL/bin/jhat
sudo update-alternatives --set jinfo $JDK_INSTALL/bin/jinfo
sudo update-alternatives --set jmap $JDK_INSTALL/bin/jmap
sudo update-alternatives --set jps $JDK_INSTALL/bin/jps
sudo update-alternatives --set jrunscript $JDK_INSTALL/bin/jrunscript
sudo update-alternatives --set jsadebugd $JDK_INSTALL/bin/jsadebugd
sudo update-alternatives --set jstack $JDK_INSTALL/bin/jstack
sudo update-alternatives --set jstat $JDK_INSTALL/bin/jstat
sudo update-alternatives --set jstatd $JDK_INSTALL/bin/jstatd
sudo update-alternatives --set keytool $JDK_INSTALL/bin/keytool
sudo update-alternatives --set native2ascii $JDK_INSTALL/bin/native2ascii
sudo update-alternatives --set orbd $JDK_INSTALL/bin/orbd
sudo update-alternatives --set pack200 $JDK_INSTALL/bin/pack200
sudo update-alternatives --set policytool $JDK_INSTALL/bin/policytool
sudo update-alternatives --set rmic $JDK_INSTALL/bin/rmic
sudo update-alternatives --set rmid $JDK_INSTALL/bin/rmid
sudo update-alternatives --set rmiregistry $JDK_INSTALL/bin/rmiregistry
sudo update-alternatives --set schemagen $JDK_INSTALL/bin/schemagen
sudo update-alternatives --set serialver $JDK_INSTALL/bin/serialver
sudo update-alternatives --set servertool $JDK_INSTALL/bin/servertool
sudo update-alternatives --set tnameserv $JDK_INSTALL/bin/tnameserv
sudo update-alternatives --set unpack200 $JDK_INSTALL/bin/unpack200
sudo update-alternatives --set wsgen $JDK_INSTALL/bin/wsgen
sudo update-alternatives --set wsimport $JDK_INSTALL/bin/wsimport
sudo update-alternatives --set xjc $JDK_INSTALL/bin/xjc
