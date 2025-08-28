let
  stable = import <nixos> {};
in
  stable.mkShell {
    buildInputs = with stable; [
      cmake
      llvmPackages_18.clang-tools
      llvmPackages_18.clang
      pkg-config
      bear
      gdb
      wlr-randr

      # dwl dependencies
      libinput
      wayland
      wayland-scanner
      wlroots_0_19
      libxkbcommon
      wayland-protocols
      pixman

      # XWayland support (optional)
      xorg.libxcb
      xorg.xcbutilwm
      xwayland
    ];

    shellHook = ''
      export CC=clang
      if [ ! -f compile_commands.json ]; then
        bear -- make
      fi
    '';
  }
