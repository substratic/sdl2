(include "c-define-base-macros#.scm")

(c-declare "#include \"SDL.h\"")
(c-declare "#include \"SDL_image.h\"")
(c-declare "#include \"SDL_ttf.h\"")

(c-define-constants
 SDL_INIT_VIDEO)

(c-define-constants
 SDL_FALSE
 SDL_TRUE)

(c-define-type size-t unsigned-int)
(c-define-type void* (pointer void))
(c-define-type void** (pointer void*))
(c-define-type unsigned-int8* (pointer unsigned-int8))
(c-define-type unsigned-int8** (pointer unsigned-int8*))
(c-define-type unsigned-int16* (pointer unsigned-int16))
(c-define-type float* (pointer float))
(c-define-type int* (pointer int))
(c-define-type unsigned-int32* (pointer unsigned-int32))

(c-define-type* (struct SDL_SysWMinfo))
(c-define-type SDL_Window (struct "SDL_Window"))
(c-define-type SDL_Window* (pointer SDL_Window))
(c-define-type SDL_Window** (pointer SDL_Window*))
(c-define-type SDL_Renderer (struct "SDL_Renderer"))
(c-define-type SDL_Renderer* (pointer SDL_Renderer))
(c-define-type SDL_Renderer** (pointer SDL_Renderer*))
(c-define-type SDL_Texture (struct "SDL_Texture"))
(c-define-type SDL_Texture* (pointer SDL_Texture))
(c-define-type* (struct SDL_Color))
(c-define-type* (struct SDL_Palette))
(c-define-type* (struct SDL_PixelFormat))
(c-define-type* (struct SDL_Surface))
(c-define-type* (struct SDL_Rect))
(c-define-type* (struct SDL_Point))
(c-define-type* (union SDL_Event))
(c-define-type* (struct SDL_WindowEvent))
(c-define-type* (struct SDL_KeyboardEvent))
(c-define-type* (struct SDL_Keysym))
;; (c-define-type* (struct SDL_TextEditingEvent))
;; (c-define-type* (struct SDL_TextInputEvent))
;; (c-define-type* (struct SDL_TouchFingerEvent))
;; (c-define-type* (struct SDL_MouseButtonEvent))
;; (c-define-type* (struct SDL_MouseMotionEvent))
;; (c-define-type* (struct SDL_MouseWheelEvent))
;; (c-define-type* (struct SDL_MultiGestureEvent))
;; (c-define-type* (struct SDL_JoyAxisEvent))
;; (c-define-type* (struct SDL_JoyBallEvent))
;; (c-define-type* (struct SDL_JoyButtonEvent))
;; (c-define-type* (struct SDL_JoyDeviceEvent))
;; (c-define-type* (struct SDL_JoyHatEvent))
;; (c-define-type* (struct SDL_ControllerAxisEvent))
;; (c-define-type* (struct SDL_ControllerButtonEvent))
;; (c-define-type* (struct SDL_ControllerDeviceEvent))
;; (c-define-type* (struct SDL_DollarGestureEvent))
;; (c-define-type* (struct SDL_QuitEvent))
;; (c-define-type* (struct SDL_UserEvent))
;; (c-define-type* (struct SDL_SysWMEvent))
;; (c-define-type* (struct SDL_DropEvent))
(c-define-type SDL_Scancode int) ; enum
(c-define-type SDL_Keycode int) ; enum
(c-define-type SDL_Keymod int) ; enum
(c-define-type SDL_bool int)
(c-define-type SDL_RendererFlip int) ; enum
(c-define-type SDL_BlendMode int) ; enum
(c-define-type SDL_BlendMode* (pointer SDL_BlendMode))
(c-define-type SDL_HintPriority int) ; enum

(c-define-struct SDL_Rect
                 (x int)
                 (y int)
                 (w int)
                 (h int))

(c-define-struct SDL_Surface
                 (format SDL_PixelFormat*)
                 (w int)
                 (h int)
                 (pitch int)
                 (pixels void*)
                 (userdata void*)
                 (clip_rect (struct SDL_Rect))
                 (refcount int))

(c-define-struct SDL_Color
                 (r unsigned-int8)
                 (g unsigned-int8)
                 (b unsigned-int8)
                 (a unsigned-int8))

(c-define-struct SDL_Palette
                 (ncolors int)
                 (colors (struct-array SDL_Color)))

(c-define-struct SDL_WindowEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (event unsigned-int8)
                 (data1 int32)
                 (data2 int32))

(c-define-struct SDL_Keysym
                 (scancode SDL_Scancode)
                 (sym SDL_Keycode)
                 (mod unsigned-int16))

(c-define-struct SDL_KeyboardEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (state unsigned-int8)
                 (repeat unsigned-int8)
                 (keysym (struct SDL_Keysym)))

(c-define-union SDL_Event
                (type unsigned-int32)
                (window (struct SDL_WindowEvent))
                (key (struct SDL_KeyboardEvent)))
                ;; (edit (struct SDL_TextEditingEvent))
                ;; (text (struct SDL_TextInputEvent))
                ;; (motion (struct SDL_MouseMotionEvent))
                ;; (button (struct SDL_MouseButtonEvent))
                ;; (wheel (struct SDL_MouseWheelEvent))
                ;; (jaxis (struct SDL_JoyAxisEvent))
                ;; (jball (struct SDL_JoyBallEvent))
                ;; (jhat (struct SDL_JoyHatEvent))
                ;; (jbutton (struct SDL_JoyButtonEvent))
                ;; (jdevice (struct SDL_JoyDeviceEvent))
                ;; (caxis (struct SDL_ControllerAxisEvent))
                ;; (cbutton (struct SDL_ControllerButtonEvent))
                ;; (cdevice (struct SDL_ControllerDeviceEvent))
                ;; (quit (struct SDL_QuitEvent))
                ;; (user (struct SDL_UserEvent))
                ;; (syswm (struct SDL_SysWMEvent))
                ;; (tfinger (struct SDL_TouchFingerEvent))
                ;; (mgesture (struct SDL_MultiGestureEvent))
                ;; (dgesture (struct SDL_DollarGestureEvent))
                ;; (drop (struct SDL_DropEvent)))

(define SDL_Init (c-lambda (unsigned-int32) int "SDL_Init"))
(define SDL_Log (c-lambda (nonnull-char-string) void "SDL_Log(\"%s\", ___arg1);"))
(define SDL_LogCritical (c-lambda (int nonnull-char-string) void "SDL_LogCritical(___arg1, \"%s\", ___arg2);"))
(define SDL_LogDebug (c-lambda (int nonnull-char-string) void "SDL_LogDebug(___arg1, \"%s\", ___arg2);"))
(define SDL_LogError (c-lambda (int nonnull-char-string) void "SDL_LogError(___arg1, \"%s\", ___arg2);"))
(define SDL_GetError (c-lambda () nonnull-char-string "SDL_GetError"))

(define SDL_GetTicks (c-lambda () unsigned-int32 "SDL_GetTicks"))

(define SDL_FillRect (c-lambda (SDL_Surface* SDL_Rect* unsigned-int32) int "SDL_FillRect"))
(define SDL_MapRGB (c-lambda (SDL_PixelFormat* unsigned-int8 unsigned-int8 unsigned-int8) unsigned-int32 "SDL_MapRGB"))

(define SDL_BlitScaled (c-lambda (SDL_Surface* SDL_Rect* SDL_Surface* SDL_Rect*) int "SDL_BlitScaled"))
(define SDL_BlitSurface (c-lambda (SDL_Surface* SDL_Rect* SDL_Surface* SDL_Rect*) int "SDL_BlitSurface"))

(define SDL_SetColorKey (c-lambda (SDL_Surface* int unsigned-int32) int "SDL_SetColorKey"))

(define SDL_SetHint (c-lambda (nonnull-char-string nonnull-char-string) SDL_bool "SDL_SetHint"))
(define SDL_SetHintWithPriority (c-lambda (nonnull-char-string nonnull-char-string SDL_HintPriority) SDL_bool "SDL_SetHintWithPriority"))
(define SDL_GetHint (c-lambda (nonnull-char-string) nonnull-char-string "SDL_GetHint"))

(define SDL_ConvertSurface (c-lambda (SDL_Surface* SDL_PixelFormat* unsigned-int32) SDL_Surface* "SDL_ConvertSurface"))

(define SDL_Delay (c-lambda (unsigned-int32) void "SDL_Delay"))

(define SDL_PollEvent (c-lambda (SDL_Event*) int "SDL_PollEvent"))

(define SDL_CreateWindow (c-lambda (nonnull-char-string int int int int unsigned-int32) SDL_Window* "SDL_CreateWindow"))
(define SDL_DestroyWindow (c-lambda (SDL_Window*) void "SDL_DestroyWindow"))
(define SDL_UpdateWindowSurface (c-lambda (SDL_Window*) int "SDL_UpdateWindowSurface"))

(define SDL_GetWindowWMInfo (c-lambda (SDL_Window* SDL_SysWMinfo*) SDL_bool "SDL_GetWindowWMInfo"))
(define SDL_GetWindowSize (c-lambda (SDL_Window* int* int*) void "SDL_GetWindowSize"))
(define SDL_GetWindowSurface (c-lambda (SDL_Window*) SDL_Surface* "SDL_GetWindowSurface"))

(define SDL_Quit (c-lambda () void "SDL_Quit"))

(define SDL_CreateTexture (c-lambda (SDL_Renderer* unsigned-int32 int int int) SDL_Texture* "SDL_CreateTexture"))
(define SDL_CreateTextureFromSurface (c-lambda (SDL_Renderer* SDL_Surface*) SDL_Texture* "SDL_CreateTextureFromSurface"))
(define SDL_SetTextureAlphaMod (c-lambda (SDL_Texture* unsigned-int8) int "SDL_SetTextureAlphaMod"))
(define SDL_SetTextureBlendMode (c-lambda (SDL_Texture* SDL_BlendMode) int "SDL_SetTextureBlendMode"))
(define SDL_SetTextureColorMod (c-lambda (SDL_Texture* unsigned-int8 unsigned-int8 unsigned-int8) int "SDL_SetTextureColorMod"))

(define SDL_FreeSurface (c-lambda (SDL_Surface*) void "SDL_FreeSurface"))

(define SDL_CreateRenderer (c-lambda (SDL_Window* int unsigned-int32) SDL_Renderer* "SDL_CreateRenderer"))
(define SDL_CreateWindowAndRenderer (c-lambda (int int unsigned-int32 SDL_Window** SDL_Renderer**) int "SDL_CreateWindowAndRenderer"))
(define SDL_RenderClear (c-lambda (SDL_Renderer*) int "SDL_RenderClear"))
(define SDL_RenderCopy (c-lambda (SDL_Renderer* SDL_Texture* SDL_Rect* SDL_Rect*) int "SDL_RenderCopy"))
(define SDL_RenderCopyEx (c-lambda (SDL_Renderer* SDL_Texture* SDL_Rect* SDL_Rect* double SDL_Point* SDL_RendererFlip) int "SDL_RenderCopyEx"))
(define SDL_GetRenderDrawBlendMode (c-lambda (SDL_Renderer* SDL_BlendMode*) int "SDL_GetRenderDrawBlendMode"))
(define SDL_GetRenderDrawColor (c-lambda (SDL_Renderer* unsigned-int8* unsigned-int8* unsigned-int8* unsigned-int8*) int "SDL_GetRenderDrawColor"))
(define SDL_SetRenderDrawBlendMode (c-lambda (SDL_Renderer* SDL_BlendMode) int "SDL_SetRenderDrawBlendMode"))
(define SDL_SetRenderDrawColor (c-lambda (SDL_Renderer* unsigned-int8 unsigned-int8 unsigned-int8 unsigned-int8) int "SDL_SetRenderDrawColor"))
(define SDL_SetRenderTarget (c-lambda (SDL_Renderer* SDL_Texture*) int "SDL_SetRenderTarget"))
(define SDL_RenderDrawLine (c-lambda (SDL_Renderer* int int int int) int "SDL_RenderDrawLine"))
(define SDL_RenderDrawLines (c-lambda (SDL_Renderer* SDL_Point* int) int "SDL_RenderDrawLines"))
(define SDL_RenderDrawPoint (c-lambda (SDL_Renderer* int int) int "SDL_RenderDrawPoint"))
(define SDL_RenderDrawPoints (c-lambda (SDL_Renderer* SDL_Point* int) int "SDL_RenderDrawPoints"))
(define SDL_RenderDrawRect (c-lambda (SDL_Renderer* SDL_Rect*) int "SDL_RenderDrawRect"))
(define SDL_RenderDrawRects (c-lambda (SDL_Renderer* SDL_Rect* int) int "SDL_RenderDrawRects"))
(define SDL_RenderFillRect (c-lambda (SDL_Renderer* SDL_Rect*) int "SDL_RenderFillRect"))
(define SDL_RenderFillRects (c-lambda (SDL_Renderer* SDL_Rect* int) int "SDL_RenderFillRects"))
(define SDL_RenderGetClipRect (c-lambda (SDL_Renderer* SDL_Rect*) void "SDL_RenderGetClipRect"))
(define SDL_RenderGetLogicalSize (c-lambda (SDL_Renderer* int* int*) void "SDL_RenderGetLogicalSize"))
(define SDL_RenderGetScale (c-lambda (SDL_Renderer* float* float*) void "SDL_RenderGetScale"))
(define SDL_RenderGetViewport (c-lambda (SDL_Renderer* SDL_Rect*) void "SDL_RenderGetViewport"))
(define SDL_RenderPresent (c-lambda (SDL_Renderer*) void "SDL_RenderPresent"))
(define SDL_RenderReadPixels (c-lambda (SDL_Renderer* SDL_Rect* unsigned-int32 void* int) int "SDL_RenderReadPixels"))
(define SDL_RenderSetClipRect (c-lambda (SDL_Renderer* SDL_Rect*) int "SDL_RenderSetClipRect"))
(define SDL_RenderSetLogicalSize (c-lambda (SDL_Renderer* int int) int "SDL_RenderSetLogicalSize"))
(define SDL_RenderSetIntegerScale (c-lambda (SDL_Renderer* SDL_bool) int "SDL_RenderSetIntegerScale"))
(define SDL_RenderSetScale (c-lambda (SDL_Renderer* float float) int "SDL_RenderSetScale"))
(define SDL_RenderSetViewport (c-lambda (SDL_Renderer* SDL_Rect*) int "SDL_RenderSetViewport"))
(define SDL_RenderTargetSupported (c-lambda (SDL_Renderer*) SDL_bool "SDL_RenderTargetSupported"))

(c-define-constants
 SDL_TEXTUREACCESS_STATIC
 SDL_TEXTUREACCESS_STREAMING
 SDL_TEXTUREACCESS_TARGET
 )

(c-define-constants
 SDL_PIXELFORMAT_UNKNOWN
 SDL_PIXELFORMAT_INDEX1LSB
 SDL_PIXELFORMAT_INDEX1MSB
 SDL_PIXELFORMAT_INDEX4LSB
 SDL_PIXELFORMAT_INDEX4MSB
 SDL_PIXELFORMAT_INDEX8
 SDL_PIXELFORMAT_RGB332
 SDL_PIXELFORMAT_RGB444
 SDL_PIXELFORMAT_RGB555
 SDL_PIXELFORMAT_BGR555
 SDL_PIXELFORMAT_ARGB4444
 SDL_PIXELFORMAT_RGBA4444
 SDL_PIXELFORMAT_ABGR4444
 SDL_PIXELFORMAT_BGRA4444
 SDL_PIXELFORMAT_ARGB1555
 SDL_PIXELFORMAT_RGBA5551
 SDL_PIXELFORMAT_ABGR1555
 SDL_PIXELFORMAT_BGRA5551
 SDL_PIXELFORMAT_RGB565
 SDL_PIXELFORMAT_BGR565
 SDL_PIXELFORMAT_RGB24
 SDL_PIXELFORMAT_BGR24
 SDL_PIXELFORMAT_RGB888
 SDL_PIXELFORMAT_RGBX8888
 SDL_PIXELFORMAT_BGR888
 SDL_PIXELFORMAT_BGRX8888
 SDL_PIXELFORMAT_ARGB8888
 SDL_PIXELFORMAT_RGBA8888
 SDL_PIXELFORMAT_ABGR8888
 SDL_PIXELFORMAT_BGRA8888
 SDL_PIXELFORMAT_ARGB2101010
 SDL_PIXELFORMAT_YV12
 SDL_PIXELFORMAT_IYUV
 SDL_PIXELFORMAT_YUY2
 SDL_PIXELFORMAT_UYVY
 SDL_PIXELFORMAT_YVYU
 )

(c-define-constants
 SDL_BLENDMODE_NONE
 SDL_BLENDMODE_BLEND
 SDL_BLENDMODE_ADD
 SDL_BLENDMODE_MOD
)

(c-define-constants
 SDL_QUIT
 SDL_APP_TERMINATING
 SDL_APP_LOWMEMORY
 SDL_APP_WILLENTERBACKGROUND
 SDL_APP_DIDENTERBACKGROUND
 SDL_APP_WILLENTERFOREGROUND
 SDL_APP_DIDENTERFOREGROUND
 SDL_WINDOWEVENT
 SDL_SYSWMEVENT
 SDL_KEYDOWN
 SDL_KEYUP
 SDL_TEXTEDITING
 SDL_TEXTINPUT
 SDL_MOUSEMOTION
 SDL_MOUSEBUTTONDOWN
 SDL_MOUSEBUTTONUP
 SDL_MOUSEWHEEL
 SDL_JOYAXISMOTION
 SDL_JOYBALLMOTION
 SDL_JOYHATMOTION
 SDL_JOYBUTTONDOWN
 SDL_JOYBUTTONUP
 SDL_JOYDEVICEADDED
 SDL_JOYDEVICEREMOVED
 SDL_CONTROLLERAXISMOTION
 SDL_CONTROLLERBUTTONDOWN
 SDL_CONTROLLERBUTTONUP
 SDL_CONTROLLERDEVICEADDED
 SDL_CONTROLLERDEVICEREMOVED
 SDL_CONTROLLERDEVICEREMAPPED
 SDL_FINGERDOWN
 SDL_FINGERUP
 SDL_FINGERMOTION
 SDL_DOLLARGESTURE
 SDL_DOLLARRECORD
 SDL_MULTIGESTURE
 SDL_CLIPBOARDUPDATE
 SDL_DROPFILE
 SDL_USEREVENT
 SDL_LASTEVENT)

(c-define-constants
 SDL_RENDERER_SOFTWARE
 SDL_RENDERER_ACCELERATED
 SDL_RENDERER_PRESENTVSYNC
 SDL_RENDERER_TARGETTEXTURE)

(c-define-constants
 SDL_WINDOWPOS_CENTERED
 SDL_WINDOWPOS_UNDEFINED)

(c-define-constants
 SDL_WINDOW_SHOWN
 SDL_WINDOW_OPENGL
 SDL_WINDOW_RESIZABLE
 SDL_WINDOW_FULLSCREEN
 SDL_WINDOW_FULLSCREEN_DESKTOP
 SDL_WINDOW_ALLOW_HIGHDPI)

(c-define-constants
 SDL_WINDOWEVENT_SHOWN
 SDL_WINDOWEVENT_HIDDEN
 SDL_WINDOWEVENT_EXPOSED
 SDL_WINDOWEVENT_MOVED
 SDL_WINDOWEVENT_RESIZED
 SDL_WINDOWEVENT_SIZE_CHANGED
 SDL_WINDOWEVENT_MINIMIZED
 SDL_WINDOWEVENT_MAXIMIZED
 SDL_WINDOWEVENT_RESTORED
 SDL_WINDOWEVENT_ENTER
 SDL_WINDOWEVENT_LEAVE
 SDL_WINDOWEVENT_FOCUS_GAINED
 SDL_WINDOWEVENT_FOCUS_LOST
 SDL_WINDOWEVENT_CLOSE)

(c-define-constants
 SDLK_UNKNOWN
 SDLK_RETURN
 SDLK_ESCAPE
 SDLK_BACKSPACE
 SDLK_TAB
 SDLK_SPACE
 SDLK_EXCLAIM
 SDLK_QUOTEDBL
 SDLK_HASH
 SDLK_PERCENT
 SDLK_DOLLAR
 SDLK_AMPERSAND
 SDLK_QUOTE
 SDLK_LEFTPAREN
 SDLK_RIGHTPAREN
 SDLK_ASTERISK
 SDLK_PLUS
 SDLK_COMMA
 SDLK_MINUS
 SDLK_PERIOD
 SDLK_SLASH
 SDLK_0
 SDLK_1
 SDLK_2
 SDLK_3
 SDLK_4
 SDLK_5
 SDLK_6
 SDLK_7
 SDLK_8
 SDLK_9
 SDLK_COLON
 SDLK_SEMICOLON
 SDLK_LESS
 SDLK_EQUALS
 SDLK_GREATER
 SDLK_QUESTION
 SDLK_AT
 SDLK_LEFTBRACKET
 SDLK_BACKSLASH
 SDLK_RIGHTBRACKET
 SDLK_CARET
 SDLK_UNDERSCORE
 SDLK_BACKQUOTE
 SDLK_a
 SDLK_b
 SDLK_c
 SDLK_d
 SDLK_e
 SDLK_f
 SDLK_g
 SDLK_h
 SDLK_i
 SDLK_j
 SDLK_k
 SDLK_l
 SDLK_m
 SDLK_n
 SDLK_o
 SDLK_p
 SDLK_q
 SDLK_r
 SDLK_s
 SDLK_t
 SDLK_u
 SDLK_v
 SDLK_w
 SDLK_x
 SDLK_y
 SDLK_z
 SDLK_CAPSLOCK
 SDLK_F1
 SDLK_F2
 SDLK_F3
 SDLK_F4
 SDLK_F5
 SDLK_F6
 SDLK_F7
 SDLK_F8
 SDLK_F9
 SDLK_F10
 SDLK_F11
 SDLK_F12
 SDLK_PRINTSCREEN
 SDLK_SCROLLLOCK
 SDLK_PAUSE
 SDLK_INSERT
 SDLK_HOME
 SDLK_PAGEUP
 SDLK_DELETE
 SDLK_END
 SDLK_PAGEDOWN
 SDLK_RIGHT
 SDLK_LEFT
 SDLK_DOWN
 SDLK_UP
 SDLK_NUMLOCKCLEAR
 SDLK_KP_DIVIDE
 SDLK_KP_MULTIPLY
 SDLK_KP_MINUS
 SDLK_KP_PLUS
 SDLK_KP_ENTER
 SDLK_KP_1
 SDLK_KP_2
 SDLK_KP_3
 SDLK_KP_4
 SDLK_KP_5
 SDLK_KP_6
 SDLK_KP_7
 SDLK_KP_8
 SDLK_KP_9
 SDLK_KP_0
 SDLK_KP_PERIOD
 SDLK_APPLICATION
 SDLK_POWER
 SDLK_KP_EQUALS
 SDLK_F13
 SDLK_F14
 SDLK_F15
 SDLK_F16
 SDLK_F17
 SDLK_F18
 SDLK_F19
 SDLK_F20
 SDLK_F21
 SDLK_F22
 SDLK_F23
 SDLK_F24
 SDLK_EXECUTE
 SDLK_HELP
 SDLK_MENU
 SDLK_SELECT
 SDLK_STOP
 SDLK_AGAIN
 SDLK_UNDO
 SDLK_CUT
 SDLK_COPY
 SDLK_PASTE
 SDLK_FIND
 SDLK_MUTE
 SDLK_VOLUMEUP
 SDLK_VOLUMEDOWN
 SDLK_KP_COMMA
 SDLK_KP_EQUALSAS400
 SDLK_ALTERASE
 SDLK_SYSREQ
 SDLK_CANCEL
 SDLK_CLEAR
 SDLK_PRIOR
 SDLK_RETURN2
 SDLK_SEPARATOR
 SDLK_OUT
 SDLK_OPER
 SDLK_CLEARAGAIN
 SDLK_CRSEL
 SDLK_EXSEL
 SDLK_KP_00
 SDLK_KP_000
 SDLK_THOUSANDSSEPARATOR
 SDLK_DECIMALSEPARATOR
 SDLK_CURRENCYUNIT
 SDLK_CURRENCYSUBUNIT
 SDLK_KP_LEFTPAREN
 SDLK_KP_RIGHTPAREN
 SDLK_KP_LEFTBRACE
 SDLK_KP_RIGHTBRACE
 SDLK_KP_TAB
 SDLK_KP_BACKSPACE
 SDLK_KP_A
 SDLK_KP_B
 SDLK_KP_C
 SDLK_KP_D
 SDLK_KP_E
 SDLK_KP_F
 SDLK_KP_XOR
 SDLK_KP_POWER
 SDLK_KP_PERCENT
 SDLK_KP_LESS
 SDLK_KP_GREATER
 SDLK_KP_AMPERSAND
 SDLK_KP_DBLAMPERSAND
 SDLK_KP_VERTICALBAR
 SDLK_KP_DBLVERTICALBAR
 SDLK_KP_COLON
 SDLK_KP_HASH
 SDLK_KP_SPACE
 SDLK_KP_AT
 SDLK_KP_EXCLAM
 SDLK_KP_MEMSTORE
 SDLK_KP_MEMRECALL
 SDLK_KP_MEMCLEAR
 SDLK_KP_MEMADD
 SDLK_KP_MEMSUBTRACT
 SDLK_KP_MEMMULTIPLY
 SDLK_KP_MEMDIVIDE
 SDLK_KP_PLUSMINUS
 SDLK_KP_CLEAR
 SDLK_KP_CLEARENTRY
 SDLK_KP_BINARY
 SDLK_KP_OCTAL
 SDLK_KP_DECIMAL
 SDLK_KP_HEXADECIMAL
 SDLK_LCTRL
 SDLK_LSHIFT
 SDLK_LALT
 SDLK_LGUI
 SDLK_RCTRL
 SDLK_RSHIFT
 SDLK_RALT
 SDLK_RGUI
 SDLK_MODE
 SDLK_AUDIONEXT
 SDLK_AUDIOPREV
 SDLK_AUDIOSTOP
 SDLK_AUDIOPLAY
 SDLK_AUDIOMUTE
 SDLK_MEDIASELECT
 SDLK_WWW
 SDLK_MAIL
 SDLK_CALCULATOR
 SDLK_COMPUTER
 SDLK_AC_SEARCH
 SDLK_AC_HOME
 SDLK_AC_BACK
 SDLK_AC_FORWARD
 SDLK_AC_STOP
 SDLK_AC_REFRESH
 SDLK_AC_BOOKMARKS
 SDLK_BRIGHTNESSDOWN
 SDLK_BRIGHTNESSUP
 SDLK_DISPLAYSWITCH
 SDLK_KBDILLUMTOGGLE
 SDLK_KBDILLUMDOWN
 SDLK_KBDILLUMUP
 SDLK_EJECT
 SDLK_SLEEP)

(c-define-constants
 KMOD_NONE
 KMOD_LSHIFT
 KMOD_RSHIFT
 KMOD_LCTRL
 KMOD_RCTRL
 KMOD_LALT
 KMOD_RALT
 KMOD_LGUI
 KMOD_RGUI
 KMOD_NUM
 KMOD_CAPS
 KMOD_MODE
 KMOD_CTRL
 KMOD_SHIFT
 KMOD_ALT
 KMOD_GUI
 )

(c-define-constants
 SDL_HINT_DEFAULT
 SDL_HINT_NORMAL
 SDL_HINT_OVERRIDE)

(c-define-constants
 IMG_INIT_JPG
 IMG_INIT_PNG
 IMG_INIT_TIF)

(define IMG_GetError (c-lambda () char-string "IMG_GetError"))
(define IMG_Init (c-lambda (int) int "IMG_Init"))
(define IMG_Load (c-lambda (char-string) SDL_Surface* "IMG_Load"))

(define get-window-size
  (c-lambda (SDL_Renderer*) void
#<<c-lambda-end
    int x, y;
    SDL_GetRendererOutputSize(___arg1, &x, &y);
    printf( "Renderer SIZE: %d / %d\n", x, y);
c-lambda-end
))

(c-define-type TTF_Font (struct "TTF_Font"))
(c-define-type TTF_Font* (pointer TTF_Font))

(define TTF_GetError
  (c-lambda () char-string "TTF_GetError"))

(define TTF_Init
  (c-lambda () int "TTF_Init"))

(define TTF_Quit
  (c-lambda () void "TTF_Quit"))

(define TTF_OpenFont
  (c-lambda (char-string int) TTF_Font* "TTF_OpenFont"))

(define TTF_CloseFont
  (c-lambda (TTF_Font*) void "TTF_CloseFont"))

(define TTF_FontHeight
  (c-lambda (TTF_Font*) int "TTF_FontHeight"))

(define TTF_RenderText_Blended
  (c-lambda (TTF_Font* char-string SDL_Color) SDL_Surface* "TTF_RenderText_Blended"))

(define TTF_RenderText_Solid
  (c-lambda (TTF_Font* char-string SDL_Color) SDL_Surface* "TTF_RenderText_Solid"))

(define TTF_RenderUTF8_Blended
  (c-lambda (TTF_Font* char-string SDL_Color) SDL_Surface* "TTF_RenderUTF8_Blended"))

(define TTF_RenderUTF8_Solid
  (c-lambda (TTF_Font* char-string SDL_Color) SDL_Surface* "TTF_RenderUTF8_Solid"))

(define make-sdl-color (c-lambda (int int int int) SDL_Color
#<<c-lambda-end
    SDL_Color color = { ___arg1, ___arg2, ___arg3, ___arg4 };
    ___return(color);
c-lambda-end
))

;; Disable parinfer-mode in this file because it messes with
;; c-declare and c-lambda formatting.

;; Local Variables:
;; eval: (parinfer-mode-disable)
;; End:
