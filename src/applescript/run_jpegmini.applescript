-- Feed a folder of images into JPEGmini
on run_jpegmini(imgPath)
  try
    tell application "JPEGmini"

      -- start the app
      activate

      -- let it boot up
      delay 2

      -- ensure it still has focus
      activate

    end tell

    tell application "System Events"
      tell process "JPEGmini"

        -- Navigate to the File > Open menu
        click menu item "Open…" of menu 1 of menu bar item "File" of menu bar 1

        -- command+shift+g in Finder lets us enter file paths direct
        keystroke "g" using {command down, shift down}

        -- enter the path to our folder of images
        keystroke imgPath

        -- and navigate to it
        keystroke return

        -- let Finder resolve the path
        delay 1

        -- start JPEGmini off optimising the folder
        click button "Open" of sheet 1 of window "JPEGmini"

        -- report success
        return true

      end tell
    end tell

    -- report success
    return true

    on error error_message

      -- report failure
      return false

  end try
end run_jpegmini