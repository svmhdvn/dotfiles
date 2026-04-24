  #[:Escape {:mod4 true :mod1 true :shift true :ctrl true} (action/passthrough)]
(array/push
  (config :xkb-bindings)
  [:Return {:mod4 true} (action/spawn ["footclient"])]
  [:XF86MonBrightnessUp {} (action/spawn ["brightnessctl" "set" "2%+"])]
  [:XF86MonBrightnessDown {} (action/spawn ["brightnessctl" "set" "2%-"])]
  [:XF86AudioMute {} (action/spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"])]
  [:XF86AudioMicMute {} (action/spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"])]
  [:XF86AudioRaiseVolume {} (action/spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"])]
  [:XF86AudioLowerVolume {} (action/spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"])]
  [:d {:mod4 true} (action/spawn ["mywmenu"])]
  [:t {:mod4 true} (action/spawn ["mywstatus"])]
  [:q {:mod4 true :shift true} (action/close)]
  [:space {:mod4 true} (action/zoom)]
  [:h {:mod4 true} (action/focus :prev)]
  [:n {:mod4 true} (action/focus :next)]
  [:e {:mod4 true} (action/focus :prev)]
  [:i {:mod4 true} (action/focus :next)]
  [:Left {:mod4 true} (action/focus :prev)]
  [:Right {:mod4 true} (action/focus :next)]
  [:Up {:mod4 true} (action/focus :prev)]
  [:Down {:mod4 true} (action/focus :next)]
  [:h {:mod4 true :shift true} (action/focus-output)]
  [:i {:mod4 true :shift true} (action/focus-output)]
  [:Left {:mod4 true :shift true} (action/focus-output)]
  [:Right {:mod4 true :shift true} (action/focus-output)]
  [:f {:mod4 true} (action/fullscreen)]
  [:space {:mod4 true :shift true} (action/float)]
  [:s {:mod4 true :shift true} (action/spawn ["sh" "-c" "grim -g \"$(slurp)\" - | wl-copy"])]
  [:x {:mod4 true :shift true} (action/exit-session)]
  [:0 {:mod4 true} (action/focus-all-tags)])

(for i 1 10
  (def keysym (keyword i))
  (array/push
    (config :xkb-bindings)
    [keysym {:mod4 true} (action/focus-tag i)]
    [keysym {:mod4 true :shift true} (action/set-tag i)]
    [keysym {:mod4 true :mod1 true :shift true} (action/toggle-tag i)]))

(merge-into config dark)
(merge-into config @{
  :tap-to-click false
  :natural-scroll true
  :dwt true
  :focus-follow-mouse true
  :border-width 3
  :outer-padding 0
  :inner-padding 0
  :kbd-repeat-info {:rate 50 :delay 250}})

(array/push
  (config :pointer-bindings)
  [:left {:mod4 :true} (action/pointer-move)]
  [:right {:mod4 :true} (action/pointer-resize)])
