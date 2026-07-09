app: category: exts:
builtins.listToAttrs (
  map (ext: {
    name = "${category}/${ext}";
    value = [ app ];
  }) exts
)
