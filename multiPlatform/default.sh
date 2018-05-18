case $OSTYPE in
  linux-gnu)
    cd $HOME
    
    # Downloads the csv with the backgrounds
    curl https://gist.githubusercontent.com/PootisPenserHere/8a5be4f5effee433fb298668effe3475/raw/af8f527d1a52dc823fc8077026333d9409f1894f/prankScriptBackgrounds.csv > prankBackgrounds.csv
    
    allImageLinks=( $(cut -d ',' -f1 prankBackgrounds.csv ) )
    totalImages=`wc -l prankBackgrounds.csv`
    
    fileName="prankBackground.jpg"
    randomNumber="$(shuf -i 1-$totalImages -n 1)"

    imageLink=${allImageLinks[randomNumber]}

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
