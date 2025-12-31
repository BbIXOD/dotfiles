{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Maksym Diachok"; 
      user.email = "maksdyachok2005@gmail.com";
      push.default = "current";
      color.ui = "auto";
    };
    ignores = [
      ".geminiignore"
      "GEMINI.md"
    ];
  };
}
