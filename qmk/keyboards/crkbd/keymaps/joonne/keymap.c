#include QMK_KEYBOARD_H

enum layer_names {
  BASE,
  NAVI,
  NUM,
  SYM,
  FNMD
};

enum custom_keycodes {
  ARROW = SAFE_RANGE
};

// Colemak Left-hand home row mods
#define CTL_A LCTL_T(KC_A)
#define ALT_R LALT_T(KC_R)
#define GUI_S LGUI_T(KC_S)
#define SFT_TT LSFT_T(KC_T) // for some reason SFT_T is not a valid name

// Colemak Right-hand home row mods
#define SFT_N RSFT_T(KC_N)
#define GUI_E RGUI_T(KC_E)
#define ALT_I LALT_T(KC_I)
#define CTL_O RCTL_T(KC_O)

// Layer triggers
#define SYM_ESC LT(SYM, KC_ESC)
#define NUM_TAB LT(NUM, KC_TAB)
#define FNMD_ENT LT(FNMD, KC_ENT)

// Miscellaneous double-duty keys
#define MEH_GRV MEH_T(KC_GRV)
#define LOGOUT C(G(S(A(KC_Z))))
#define LOCK C(G(KC_Q))

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [BASE] = LAYOUT_split_3x6_3(
      KC_LBRC,    KC_Q,    KC_W,    KC_F,    KC_P,    KC_B,                         KC_J,    KC_L,    KC_U,    KC_Y, KC_SCLN, KC_RBRC,
      KC_MINS,   CTL_A,   ALT_R,   GUI_S,  SFT_TT,    KC_G,                         KC_M,   SFT_N,   GUI_E,   ALT_I,   CTL_O, KC_QUOT,
      SC_LSPO,    KC_Z,    KC_X,    KC_C,    KC_D,    KC_V,                         KC_K,    KC_H, KC_COMM,  KC_DOT, KC_SLSH, SC_RSPC,
                                          SYM_ESC,MO(NAVI), NUM_TAB,    FNMD_ENT, KC_SPC, MEH_GRV
  ),

  [NAVI] = LAYOUT_split_3x6_3(
       LOGOUT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,    LOCK,                      KC_AGIN, KC_UNDO, KC_COPY, KC_PSTE,  KC_CUT, XXXXXXX,
      XXXXXXX, KC_LCTL, KC_LALT, KC_LGUI, KC_LSFT, KC_PSCR,                      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT, KC_CAPS, XXXXXXX,
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_HOME, KC_PGDN, KC_PGUP,  KC_END, XXXXXXX, XXXXXXX,
                                          XXXXXXX, _______, XXXXXXX,     KC_DEL, KC_BSPC,  KC_GRV
  ),

  [NUM] = LAYOUT_split_3x6_3(
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX,    KC_7,    KC_8,    KC_9, XXXXXXX, XXXXXXX,
      XXXXXXX, KC_LCTL, KC_LALT, KC_LGUI, KC_LSFT, XXXXXXX,                      XXXXXXX,    KC_4,    KC_5,    KC_6,    KC_0, XXXXXXX,
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX,    KC_1,    KC_2,    KC_3, XXXXXXX, XXXXXXX,
                                          XXXXXXX, XXXXXXX, _______,     KC_DEL, KC_BSPC,  KC_GRV
  ),

  [SYM] = LAYOUT_split_3x6_3(
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                       KC_EQL, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, XXXXXXX,
      XXXXXXX, KC_LCTL, KC_LALT, KC_LGUI, KC_LSFT, XXXXXXX,                        ARROW,  KC_DLR, KC_PERC, KC_CIRC, KC_BSLS, XXXXXXX,
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_PLUS, KC_EXLM, KC_AT,   KC_HASH, XXXXXXX, XXXXXXX,
                                          _______, XXXXXXX, XXXXXXX,     KC_DEL, KC_BSPC,  KC_GRV
  ),

  [FNMD] = LAYOUT_split_3x6_3(
      QK_BOOT, XXXXXXX,   KC_F7,   KC_F8,   KC_F9,  KC_F10,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
      XXXXXXX, XXXXXXX,   KC_F4,   KC_F5,   KC_F6,  KC_F11,                      KC_MPRV, KC_VOLD, KC_VOLU, KC_MNXT, KC_MPLY, XXXXXXX,
      XXXXXXX, XXXXXXX,   KC_F1,   KC_F2,   KC_F3,  KC_F12,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                                          KC_VOLD, KC_MPLY, KC_VOLU,    _______, XXXXXXX, XXXXXXX
  )
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
  case ARROW:
    if (record->event.pressed) {
      SEND_STRING("=>");
    }
    break;
  }
  return true;
};

#ifdef OLED_ENABLE

oled_rotation_t oled_init_user(oled_rotation_t rotation) {
  if (!is_keyboard_master()) {
    return OLED_ROTATION_180;
  }
  return rotation;
}

void oled_render_layer_state(void) {
  switch (get_highest_layer(layer_state)) {
    case BASE:
      oled_write_ln_P(PSTR("Base"), false);
      break;
    case NAVI:
      oled_write_ln_P(PSTR("Navi"), false);
      break;
    case NUM:
      oled_write_ln_P(PSTR("Numb"), false);
      break;
    case SYM:
      oled_write_ln_P(PSTR("Sym "), false);
      break;
    case FNMD:
      oled_write_ln_P(PSTR("Func"), false);
      break;
    default:
      oled_write_ln_P(PSTR("Unkn"), false);
      break;
  }

  led_t led_state = host_keyboard_led_state();
  oled_write_P(led_state.caps_lock ? PSTR("ABC ") : PSTR("    "), false);
}

void oled_render_logo(void) {
  static const char PROGMEM crkbd_logo[] = {
    0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93, 0x94,
    0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0xb0, 0xb1, 0xb2, 0xb3, 0xb4,
    0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1, 0xd2, 0xd3, 0xd4,
    0};
  oled_write_P(crkbd_logo, false);
}

bool oled_task_user(void) {
  if (is_keyboard_master()) {
    oled_render_layer_state();
  } else {
    oled_render_logo();
  }
  return false;
}

#endif // OLED_ENABLE
