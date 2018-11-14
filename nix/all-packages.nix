self: super:

{
  # TODO: delete after upstream update
  # https://github.com/NixOS/nixpkgs/pull/48494
  xcpretty = self.bundlerEnv {
    inherit (self) ruby;
    pname = "xcpretty";
    gemdir = ./xcpretty;
  };

  expo-cli = (super.callPackage ./nodepackages { pkgs = self; }).expo-cli.override {
    buildInputs = [ super.watchman ];
  };
}
