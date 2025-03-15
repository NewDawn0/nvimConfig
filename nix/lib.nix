let
  getAttrsRec = with builtins;
    attrs:
    mapAttrs (k: v:
      if isBool v then
        if v then "true" else "false"
      else if isList v then
      # We have to use an unused symbol in lua like `|` because `"` is replaced with `\\` which breaks luaeval
      # It is later replaced back in replaceStrings
        "{|" + concatStringsSep "|,|" v + "|}"
      else
        getAttrsRec v) attrs;
  luaOpts = with builtins;
    opts:
    let
      string = replaceStrings [ ''"'' ":" "|" ] [ "" "=" ''"'' ]
        (toString (toJSON (getAttrsRec opts)));
    in substring 1 ((stringLength string) - 2) string;
in { inherit luaOpts; }
