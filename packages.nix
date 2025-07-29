{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # latte-dock
    gnome.gnome-tweaks
    vivaldi
    git
    unciv
    vivaldi-ffmpeg-codecs
    vscodium
    clementine
    gimp
    libreoffice-fresh
    neofetch
    discord
    # plasma-browser-integration
    wineWowPackages.staging
    winetricks
    dosbox-staging
    ferdium
    appimage-run
    mullvad-vpn
    starship
    # libsForQt5.discover
    # nix-software-center
    libsForQt5.ktorrent
    # kcalc
    lutris
    libsForQt5.kamoso
    blueman
    bluez
    gparted
    vlc

    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];
  # virtualbox
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "ellie" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;

}
