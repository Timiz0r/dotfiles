if test (kreadconfig6 --file kwinrc --group Plugins --key clear-top-monitorEnabled) != true
    kwriteconfig6 --file kwinrc --group Plugins --key clear-top-monitorEnabled true
    kwriteconfig6 --file kglobalshortcutsrc --group kwin --key clearTopMonitor "Ctrl+Alt+9,none,Clear top monitor"
    qdbus6 org.kde.KWin /KWin reconfigure
end