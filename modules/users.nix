{ username, ... }:
{
  users.users."${username}" = {
    isNormalUser = true;
    description = "Maksym Diachok";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "video"
      "render"
      "input"
    ];
  };
}
