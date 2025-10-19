function kde_activity
    set -l id (dbus-send --session --dest=org.kde.ActivityManager --type=method_call --print-reply=literal \
        /ActivityManager/Activities org.kde.ActivityManager.Activities.CurrentActivity | tr -d "[:blank:]")
    set -l details (dbus-send --session --dest=org.kde.ActivityManager --type=method_call --print-reply \
        /ActivityManager/Activities org.kde.ActivityManager.Activities.ActivityInformation "string:$id" | string collect)
    string match -rq '\
   struct {
      string "[^"]+"
      string "(?<name>[^"]+)"' -- $details
    if test $status -eq 0
        echo $name
    end
end
