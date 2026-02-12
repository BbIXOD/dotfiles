{ stdenvNoCC, inputs }:

stdenvNoCC.mkDerivation {
  pname = "msnap";
  version = "unstable";

  src = inputs.msnap;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m755 mcast/mcast $out/bin/mcast
    install -m755 mshot/mshot $out/bin/mshot

    mkdir -p $out/share/gui
    install -m644 mcast/mcast.conf $out/share/mcast.conf
    install -m644 mshot/mshot.conf $out/share/mshot.conf
    install -m644 gui/shell.qml $out/share/gui/shell.qml
    install -m644 gui/RegionSelector.qml $out/share/gui/RegionSelector.qml

    runHook postInstall
  '';
}
