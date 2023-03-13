{ pkgs, ... }:
{
  users.users.hcbt = {
    name = "hcbt";
    home = "/Users/hcbt";
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    casks = [
      "appcleaner"
      "bitwarden"
      "clean-me"
      "discord"
      "docker"
      "eloston-chromium"
      "foobar2000"
      "google-earth-pro"
      "grandperspective"
      "hammerspoon"
      "handbrake"
      "hiddenbar"
      "iterm2"
      "karabiner-elements"
      "keka"
      "logseq"
      "lulu"
      "messenger"
      "mpv"
      "nvidia-geforce-now"
      "obs"
      "obsidian"
      "openmw"
      "orion"
      "plex-media-server"
      "postman"
      "protonmail-bridge"
      "protonvpn"
      "proxyman"
      "qbittorrent"
      "signal"
      "sloth"
      "soulseek"
      "spotify"
      "stats"
      "steam"
      "telegram"
      "tor-browser"
      "usb-overdrive"
      "utm"
      "visual-studio-code"
      "vivaldi"
      "wireshark"
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.hcbt = { pkgs, lib, inputs, config, ... }:
    {
      programs.home-manager.enable = true;
      home.stateVersion = "22.11";

      home.sessionVariables = {
        EDITOR = "micro";
        VISUAL = "code";
      };

      home.packages = with pkgs; [
        nodejs
        git
        go
        cargo
        rustc
        micro
        coreutils
        htop
        wrangler
        pkgconfig
        cmake
        python3
        python3Packages.pip
        python3Packages.virtualenv
        poetry
        bash
        wget
        curl
        gphoto2
      ];

      programs.git = {
        enable = true;
        userName = "hcbt";
        userEmail = "hcbt@protonmail.com";
        ignores = [
          ".DS_Store"
          ".AppleDouble"
          ".LSOverride"
          "Icon"
          "._*"
          ".DocumentRevisions-V100"
          ".fseventsd"
          ".Spotlight-V100"
          ".TemporaryItems"
          ".Trashes"
          ".VolumeIcon.icns"
          ".com.apple.timemachine.donotpresent"
          ".AppleDB"
          ".AppleDesktop"
          "Network Trash Folder"
          "Temporary Items"
          ".apdisk"
        ];
      };
    };
}