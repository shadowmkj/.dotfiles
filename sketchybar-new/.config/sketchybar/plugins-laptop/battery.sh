#!/usr/bin/env sh
source "$HOME/.config/sketchybar/icons.sh"
# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')
DRAWING=on
if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
  ICON=$BATTERY_100
  ICON_COLOR=0xffa6da95
  ;;
7[0-9])
  ICON=$BATTERY_75
  ICON_COLOR=0xffeed49f
  ;;
[4-6][0-9])
  ICON=$BATTERY_50
  ICON_COLOR=0xfff5a97f
  ;;
[1-3][0-9])
  ICON=$BATTERY_25
  ICON_COLOR=0xffee99a0
  ;;
[0-9])
  ICON=$BATTERY_0
  ICON_COLOR=0xffed8796
  ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATTERY_CHARGING
  ICON_COLOR=0xffa6e3a1
fi

sketchybar --set $NAME \
  icon=$ICON \
  label="${PERCENTAGE}%" \
  icon.color=${ICON_COLOR}
