{ pkgs, ... }:

{
  home.pointerCursor =
    let
      getFromTar = tarball: name: {
        name = name;
        package = pkgs.runCommand "cursor-${name}" {} ''
          mkdir -p $out/share/icons/${name}
          tar -xzf ${tarball} -C $out/share/icons/${name} --strip-components=1
        '';
      };
    in
      getFromTar
        ../../../assets/cursors/Fuchsia-Blue.tar.gz
        "Fuchsia-Blue";
}
