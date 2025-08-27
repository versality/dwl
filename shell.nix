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

      # dwl dependencies
      libinput
      wayland
      wayland-scanner
      wlroots_0_19
      libxkbcommon
      wayland-protocols
      pixman  # Add this line

      # XWayland support (optional)
      xorg.libxcb
      xwayland
    ];

    shellHook = ''
      export CC=clang
      if [ ! -f compile_commands.json ]; then
        bear -- make
      fi
    '';
  }
