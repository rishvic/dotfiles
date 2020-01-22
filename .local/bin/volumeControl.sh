case $1 in
  up)
    # set the volume on (if it was muted)
    amixer -D pulse set Master on > /dev/null
    # up the volume (+ 2%)
    amixer -D pulse sset Master 2%+ > /dev/null
    ;;
  down)
    amixer -D pulse set Master on > /dev/null
    amixer -D pulse sset Master 2%- > /dev/null
    ;;
  mute)
    # toggle mute
    amixer -D pulse set Master 1+ toggle > /dev/null
    ;;
esac

notify-volume
