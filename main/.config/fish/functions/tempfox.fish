function tempfox
    set tmp (mktemp -p /tmp -d "tempfox.XXXXXX")
    cd $tmp

    set -l prefs "$tmp/user.js"
    echo 'user_pref("app.normandy.first_run", false);' >> $prefs
    echo 'user_pref("browser.aboutwelcome.didSeeFinalScreen", true);' >> $prefs
    echo 'user_pref("trailhead.firstrun.didSeeAboutWelcome", true);' >> $prefs
    echo 'user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);' >> $prefs
    echo 'user_pref("browser.aboutwelcome.enabled", false);' >> $prefs
    echo 'user_pref("startup.homepage_welcome_url", "");' >> $prefs

    firefox -profile $tmp -new-instance 2>&1 > /dev/null &; disown
end
