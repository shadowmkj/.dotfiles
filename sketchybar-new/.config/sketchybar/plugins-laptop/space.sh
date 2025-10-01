#!/bin/zsh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME icon.highlight=on
else
  sketchybar --set $NAME icon.highlight=off
fi


# all_workspaces=("${(f)$(aerospace list-workspaces --all | awk 'NF')}")
# empty_workspaces=("${(f)$(aerospace list-workspaces --empty --monitor all | awk 'NF')}")
# non_empty_workspaces=("${(f)$(grep -Fxv -f <(aerospace list-workspaces --empty --monitor all) <(aerospace list-workspaces --all) | awk 'NF')}")


# args=()
# for space in $non_empty_workspaces
# do
#   icon_strip=" "
#   apps=$(aerospace list-windows --workspace $space | awk -F ' \\| ' '{print $2}')
#   echo $apps
#   if [ "$apps" != "" ]; then
#     while IFS= read -r app; do
#       echo APP: $app
#       icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
#     done <<< "$apps"
#   fi
#   args+=(--set space.$space label="$icon_strip" label.drawing=on)
# done
# sketchybar -m "${args[@]}"
