alias chromex="open /Applications/Google\ Chrome.app/ --args --allow-file-access-from-files"
alias ppj="jq '.'"
alias q=~/q/q.sh

function fgrep()
{
    find . -name '*'$@'*'
}

function vfgrep()
{
    vim `fgrep $@`
}

function logcat-band {
    adb logcat | grep $(adb shell ps | grep band | awk '{ print $2; }')
}

function capture-logcat {
    echo "Press [CTRL+C] to stop..";
    FILE=~/sandbox/android/rw-dev/logcat/`date +%s`;
    while :
    do
        adb logcat -b main -b system -b radio -b events -v threadtime >> $FILE
    done
}

function dump-rw-prov {
    adb root && adb wait-for-device && adb shell sqlite3 /data/data/com.android.providers.settings/databases/settings.db "select value from secure where name like 'com.bandwidth.rw.system.PROVISIONING_DOCUMENT';" | jq '.'
}

function cq {
    adb shell sqlite3 -separator "," -header /data/data/com.bandwidth.rw/databases/analytics.db "select * from cq_history;"
}

export PATH=$PATH:~/sandbox/android/adt/adt-bundle-mac-x86_64-20130514/sdk/tools:~/sandbox/android/adt/adt-bundle-mac-x86_64-20130514/sdk/platform-tools:~/sandbox/java/jad:~/sandbox/android/dex2jar/dex2jar-0.0.9.12:~/sandbox/android/apktool/apktool-install-macosx-r05-ibot:~/sandbox/bash/bin:~/sandbox/erlang/kerl

export ANDROID_NDK=/Users/jstimpson/sandbox/android/adt/adt-bundle-mac-x86_64-20130514/ndk
export ANDROID_SDK=/Users/jstimpson/sandbox/android/adt/adt-bundle-mac-x86_64-20130514/sdk

. ~/sandbox/erlang/erlang/r16b01/activate
