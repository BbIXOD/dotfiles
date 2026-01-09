{ inputs, ...}:
{
  imports = [ inputs.mango.hmModules.mango ];
  wayland.windowManager.mango = {
    enalbe = true;
  };
}
