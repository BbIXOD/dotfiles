_:
{
  networking = {
    nameservers = [ "9.9.9.9" ];
    networkmanager.enable = true;
    firewall = {
      allowedUDPPorts = [ 30000 ];
      allowedTCPPorts = [ 30000 ];
    };
  };
}
