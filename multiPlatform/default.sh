case $OSTYPE in
  linux-gnu)
    cd $HOME

    fileName="prankBackground.jpg"
    randomNumber="$(shuf -i 1-4 -n 1)"

    case $randomNumber in
    1)
      imageLink='https://i.ytimg.com/vi/hnQjRvvEnTM/hqdefault.jpg'
      ;;
    2)
      imageLink='https://st2.depositphotos.com/7177640/12447/v/450/depositphotos_124470322-stock-illustration-silhouette-of-the-dog-goes.jpg'
      ;;
    3)
      imageLink='https://wallpaper.wiki/wp-content/uploads/2017/05/Sloth-Image.jpg'
      ;;
    4)
      imageLink='https://i.imgur.com/g7bkC1l.jpg'
      ;;
    esac

    # Download the image
    curl $imageLink > $fileName

    # Incase the images takes some time to be saved we wait
    sleep 3

    # To set the background an absolute route to the file must be provided
    # this is achieved by concatenating dynamic path as long as this is
    # run from $HOME
    gsettings set org.gnome.desktop.background picture-options "wallpaper"
    first="gsettings set org.gnome.desktop.background picture-uri file://"
    second=$(pwd)
    third="/$fileName"
    final="$first$second$third"

    # Executes the concatenated command
    $final

    # Leaves a scrip ready to run so the remote version is no longer needed
    # If the bin directory doesn't exist
    if [ ! -d "bin" ]; then
      mkdir bin
    fi

    curl https://gist.githubusercontent.com/PootisPenserHere/3f2aa6513094b41a4d2b49d474a42bcc/raw/2d6c656478ea4caca14f2183b09db54d5f8855af/Dog.sh > bin/dogs
    chmod +x bin/dogs
    ;;

  dawrin16.0)
    # Download the image
    curl https://i.ytimg.com/vi/hnQjRvvEnTM/hqdefault.jpg

    # To set the background an absolute route to the file must be provided
    # this is achieved by concatenating dynamic path as long as this is
    # run from $HOME
    first='osascript -e ‘tell application “Finder” to set desktop picture to POSIX file “'
    second=$(pwd)
    third="/hqdefault.jpg"

    # Incase the images takes some time to be saved we wait
    sleep 2
    final="$first$second$third"

    # Executes the concatenated command
    $final
    ;;
esac
