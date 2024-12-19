 hml: homerow_mods_left {
         compatible = "zmk,behavior-hold-tap";
         flavor = "balanced";
         tapping-term-ms = <TAPPING_TERM_MS>;
         quick-tap-ms = <QUICK_TAP_MS>;
         require-prior-idle-ms = <IDLE_MS>;
         bindings = <&kp>, <&kp>;
         #binding-cells = <2>; 
         hold-trigger-key-positions = <KEYS_R THUMBS>;
 };

 hmr: homerow_mods_right {
         compatible = "zmk,behavior-hold-tap";
         flavor = "balanced";
         tapping-term-ms = <TAPPING_TERM_MS>;
         quick-tap-ms = <QUICK_TAP_MS>;
         require-prior-idle-ms = <IDLE_MS>;
         bindings = <&kp>, <&kp>;
         #binding-cells = <2>; 
         hold-trigger-key-positions = <KEYS_L THUMBS>;
 };

 mol: mo_left {
         compatible = "zmk,behavior-hold-tap";
         flavor = "balanced";
         tapping-term-ms = <TAPPING_TERM_MS>;
         quick-tap-ms = <QUICK_TAP_MS>;
         require-prior-idle-ms = <IDLE_MS>;
         bindings = <&mo>, <&kp>;
         #binding-cells = <2>; 
         hold-trigger-key-positions = <KEYS_R THUMBS>;
 };

 mor: mo_right {
         compatible = "zmk,behavior-hold-tap";
         flavor = "balanced";
         tapping-term-ms = <TAPPING_TERM_MS>;
         quick-tap-ms = <QUICK_TAP_MS>;
         require-prior-idle-ms = <IDLE_MS>;
         bindings = <&mo>, <&kp>;
         #binding-cells = <2>; 
         hold-trigger-key-positions = <KEYS_L THUMBS>;
 };

 slt: spacebar_layer_tap { 
         compatible = "zmk,behavior-hold-tap"; 
         #binding-cells = <2>; 
         flavor = "tap-preferred"; 
         tapping-term-ms = <TAPPING_TERM_MS>; 
         quick-tap-ms = <QUICK_TAP_MS>; 
         global-quick-tap; 
         bindings = <&mo>, <&kp>; 
 }; 

 bspc_del: backspace_delete {
     compatible = "zmk,behavior-mod-morph";
     #binding-cells = <0>;
     bindings = <&kp BACKSPACE>, <&kp DELETE>;
     mods = <(MOD_LSFT|MOD_RSFT)>;
     keep-mods = <(MOD_RSFT)>;
 };

 colon_semi: invert_colon_semi {
     compatible = "zmk,behavior-mod-morph";
     #binding-cells = <0>;
     bindings = <&kp COLON>, <&kp SEMI>;
     mods = <(MOD_LSFT|MOD_RSFT)>;
 };
