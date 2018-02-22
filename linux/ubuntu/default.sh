#!/bin/bash
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
    first="gsettings set org.gnome.desktop.background picture-uri file://"
    second=$(pwd)
    third="/$fileName"
    final="$first$second$third"

    # Executes the concatenated command
    $final
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
