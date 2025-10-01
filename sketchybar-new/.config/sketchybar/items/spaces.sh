#!/bin/zsh

all_workspaces=("${(f)$(aerospace list-workspaces --all | awk 'NF')}")
non_empty_workspaces=("${(f)$(grep -Fxv -f <(aerospace list-workspaces --empty --monitor all) <(aerospace list-workspaces --all) | awk 'NF')}")
ws=("1" "2" "3" "B" "W" "A")
sid=0
spaces=()
for i in "${ws[@]}"; do
  sid=$i
  # local show="off"
  # if (( ${non_empty_workspaces[(ie)$i]} <= ${#non_empty_workspaces[@]} )); then
  #     show="on"
  # fi
  space=(
    icon=$i
    icon.padding_left=10
    icon.padding_right=10
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$RED
    label.font="sketchybar-app-font:Regular:16.0"
    label.background.height=26
    label.background.drawing=on
    label.background.color=$BACKGROUND_2
    label.background.corner_radius=8
    label.drawing=off
    script="$PLUGIN_DIR/space.sh $i"
  )

    sketchybar --add item space.$sid left \
    --set space.$sid \
    $space[@] \
    click_script="aerospace workspace $sid" \
    --subscribe space.$sid aerospace_workspace_change 
done

spaces=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.drawing=on
)

separator=(
  icon=􀆊
  icon.font="sketchybar-app-font:Heavy:16.0"
  icon.padding_right=4
  padding_left=4
  padding_right=15
  label.drawing=off
  associated_display=active
  icon.color=$WHITE
)

sketchybar --add bracket aero '/space\..*/' \
  --set spaces "${spaces[@]}" \
  --add item separator left \
  --set separator "${separator[@]}"
