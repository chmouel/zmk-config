DEBUG_PASTE: DEBUG_PASTE {
    compatible = "zmk,behavior-macro";
    #binding-cells = <0>;
    bindings = <MYDEBUG_PASTE_MACRO>;
};

DEBUG_PASTE2: DEBUG_PASTE2 {
    compatible = "zmk,behavior-macro";
    #binding-cells = <0>;
    bindings = 
      MYDEBUG_PASTE_MACRO_2
};  

EMAIL: EMAIL {
    compatible = "zmk,behavior-macro";
    #binding-cells = <0>;
    bindings = <&none &kp C &kp H &kp M &kp O &kp U &kp E &kp L &kp AT &kp C &kp H &kp M &kp O &kp U &kp E &kp L &kp DOT &kp C &kp O &kp M>;
};

WORK_EMAIL: WORK_EMAIL {
    compatible = "zmk,behavior-macro";
    #binding-cells = <0>;
    bindings = <&none &kp C &kp B &kp O &kp U &kp D &kp J &kp N &kp A &kp AT &kp R &kp E &kp D &kp H &kp A &kp T &kp DOT &kp C &kp O &kp M>;
};
