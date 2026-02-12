{
  lib,
  stdenv,
  meson,
  ninja,
  pkg-config,
  wayland,
  wayland-protocols,
  wayland-scanner,
  scdoc,
  pixman,
  inputs,
}:
stdenv.mkDerivation {
  pname = "still";
  version = "unstable";
  src = inputs.still;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    scdoc
    wayland
    wayland-protocols
    wayland-scanner
    pixman
  ];

  mesonFlags = [
    "--buildtype=release"
  ];

  meta = with lib; {
    description = "Freeze Wayland compositors for screenshots";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
