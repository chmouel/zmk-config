#define COMBO(NAME, BINDINGS, KEYPOS) \
  combo_##NAME { \
    timeout-ms = <50>; \
    bindings = <BINDINGS>; \
    key-positions = <KEYPOS>; \
    layers = <0>; \
};

compatible = "zmk,combos";

/*                                      48 KEY MATRIX / LAYOUT MAPPING

  ╭────────────────────────┬────────────────────────╮ ╭─────────────────────────┬─────────────────────────╮
  │  0   1   2   3   4   5 │  6   7   8   9  10  11 │ │ LT5 LT4 LT3 LT2 LT1 LT0 │ RT0 RT1 RT2 RT3 RT4 RT5 │
  │ 12  13  14  15  16  17 │ 18  19  20  21  22  23 │ │ LM5 LM4 LM3 LM2 LM1 LM0 │ RM0 RM1 RM2 RM3 RM4 RM5 │
  │ 24  25  26  27  28  29 │ 30  31  32  33  34  35 │ │ LB5 LB4 LB3 LB2 LB1 LB0 │ RB0 RB1 RB2 RB3 RB4 RB5 │
  │ 36  37  38  39  40  41 │ 42  43  44  45  46  47 │ │ LH5 LH4 LH3 LH2 LH1 LH0 │ RH0 RH1 RH2 RH3 RH4 RH5 │
  ╰────────────────────────┴────────────────────────╯ ╰─────────────────────────┴─────────────────────────╯ */
COMBO(esc_caps,  &kp ESC,      RM1 RM2)
COMBO(caps_word, &caps_word,   COMBO_CAPS_1 COMBO_CAPS_2)
COMBO(goback,    &kp LG(BSPC), RM4 RT5)
