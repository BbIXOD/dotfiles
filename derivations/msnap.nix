{ stdenvNoCC, inputs }:

stdenvNoCC.mkDerivation {
  pname = "msnap";
  version = "unstable";

  src = inputs.msnap;

  installPhase = ''
    runHook preInstall

    # binaries
    mkdir -p $out/bin
    install -m755 mcast/mcast $out/bin/mcast
    install -m755 mshot/mshot $out/bin/mshot

    # data directory that mirrors ~/.config/msnap
    mkdir -p $out/share/msnap/gui/icons

    # default configs
    install -m644 mcast/mcast.conf $out/share/msnap/mcast.conf
    install -m644 mshot/mshot.conf $out/share/msnap/mshot.conf
    install -m644 gui/gui.conf     $out/share/msnap/gui.conf

    # gui files
    install -m644 gui/shell.qml           $out/share/msnap/gui/
    install -m644 gui/RegionSelector.qml  $out/share/msnap/gui/
    install -m644 gui/Icon.qml            $out/share/msnap/gui/
    install -m644 gui/Config.qml          $out/share/msnap/gui/

    # icons
    install -m644 gui/icons/*.svg $out/share/msnap/gui/icons/

    runHook postInstall
  '';
}
