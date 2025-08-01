#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#*****************************************************************************
#
#   Gradle start up script for UN*X
#
#*****************************************************************************

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done

APP_HOME=`dirname "$PRG"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
linux=false
case "`uname`" in
    CYGWIN*) cygwin=true ;;
    Darwin*) darwin=true ;;
    Linux) linux=true ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if ${cygwin} ; then
    [ -n "$APP_HOME" ] &&
        APP_HOME=`cygpath --unix "$APP_HOME"`
    [ -n "$JAVA_HOME" ] &&
        JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Attempt to find JAVA_HOME if not already set.
if [ -z "$JAVA_HOME" ] ; then
    if ${darwin} ; then
        [ -x '/usr/libexec/java_home' ] && JAVA_HOME=`/usr/libexec/java_home`
        [ -z "$JAVA_HOME" ] && [ -d /Library/Java/JavaVirtualMachines/jdk-1.8.0.jdk/Contents/Home ] && JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-1.8.0.jdk/Contents/Home
    else
        java_path=`which java 2>/dev/null`
        if [ -n "$java_path" ] ; then
            java_path=`readlink -f "$java_path" 2>/dev/null`
            if [ -n "$java_path" ] ; then
                JAVA_HOME=`dirname "$java_path" 2>/dev/null`
                JAVA_HOME=`dirname "$JAVA_HOME" 2>/dev/null`
            fi
        fi
    fi
fi

# For Cygwin, switch paths to Windows format before running java
if ${cygwin} ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
fi

if [ -z "$JAVA_HOME" ]; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.\n\nPlease set the JAVA_HOME variable in your environment to match the\nlocation of your Java installation."
fi

# Set APP_NAME
APP_NAME="Gradle"

# Set APP_BASE_NAME
APP_BASE_NAME=`basename "$0"`

# Set CLASS
CLASS='org.gradle.wrapper.GradleWrapperMain'

# Set CLASSPATH
APP_JAR_PATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
CLASSPATH="$APP_JAR_PATH"

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME\n\nPlease set the JAVA_HOME variable in your environment to match the\nlocation of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.\n\nPlease set the JAVA_HOME variable in your environment to match the\nlocation of your Java installation."
fi

# Increase the maximum number of open file descriptors to prevent
# build failures on projects with many files.
if [ "$MAX_FD" = "maximum" ] || [ "$MAX_FD" = "max" ]; then
    # Use the maximum available.
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD_LIMIT" != "unlimited" ] ; then
            ulimit -n $MAX_FD_LIMIT
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
elif [ "$MAX_FD" != "-1" ]; then
    # Use the specified value.
    ulimit -n $MAX_FD
fi

# Collect all arguments for the java command, following the shell quoting and substitution rules
eval set -- "$DEFAULT_JVM_OPTS" "$JAVA_OPTS" "$GRADLE_OPTS" \"-Dorg.gradle.appname=$APP_BASE_NAME\" -classpath \"\"\"$CLASSPATH\"\"\" \"$CLASS\" \"\"\"\$@\"\"\""

# Use "exec" on the last line to save a process.
exec "$JAVACMD" "$@"
