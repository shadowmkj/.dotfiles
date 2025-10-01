#!/bin/sh

attr_network=(
  icon=$WIFI_CONNECTED
  icon.color=0xfffab387
  # icon.highlight_color=$BACKGROUND
  icon.padding_left=6
  icon.padding_right=6
  #label="ON"
  label.padding_left=2
  label.padding_right=8
  label.width=dynamic
  padding_left=1
  padding_right=2 
  # background.color=$NETS_LEFT
  background.height=26
  background.corner_radius=15
  update_freq=30
  script="$PLUGIN_DIR/network.sh"
)

sketchybar    -m    --add         item      network     right                                 \
                    --set                   network     "${attr_network[@]}"                  \
                    --subscribe             network     wifi_change                           \
                                                        mouse.clicked                         \
                                                                                              \
