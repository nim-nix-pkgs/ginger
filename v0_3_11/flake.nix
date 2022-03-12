{
  description = ''A Grid (R) like package in Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-ginger-v0_3_11.flake = false;
  inputs.src-ginger-v0_3_11.owner = "Vindaar";
  inputs.src-ginger-v0_3_11.ref   = "refs/tags/v0.3.11";
  inputs.src-ginger-v0_3_11.repo  = "ginger";
  inputs.src-ginger-v0_3_11.type  = "github";
  
  inputs."chroma".owner = "nim-nix-pkgs";
  inputs."chroma".ref   = "master";
  inputs."chroma".repo  = "chroma";
  inputs."chroma".type  = "github";
  inputs."chroma".inputs.nixpkgs.follows = "nixpkgs";
  inputs."chroma".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."https://github.com/vindaar/seqmath".owner = "nim-nix-pkgs";
  inputs."https://github.com/vindaar/seqmath".ref   = "master";
  inputs."https://github.com/vindaar/seqmath".repo  = "https://github.com/vindaar/seqmath";
  inputs."https://github.com/vindaar/seqmath".type  = "github";
  inputs."https://github.com/vindaar/seqmath".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/vindaar/seqmath".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."cairo".owner = "nim-nix-pkgs";
  inputs."cairo".ref   = "master";
  inputs."cairo".repo  = "cairo";
  inputs."cairo".type  = "github";
  inputs."cairo".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cairo".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."https://github.com/vindaar/latexdsl".owner = "nim-nix-pkgs";
  inputs."https://github.com/vindaar/latexdsl".ref   = "master";
  inputs."https://github.com/vindaar/latexdsl".repo  = "https://github.com/vindaar/latexdsl";
  inputs."https://github.com/vindaar/latexdsl".type  = "github";
  inputs."https://github.com/vindaar/latexdsl".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/vindaar/latexdsl".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."shell".owner = "nim-nix-pkgs";
  inputs."shell".ref   = "master";
  inputs."shell".repo  = "shell";
  inputs."shell".type  = "github";
  inputs."shell".inputs.nixpkgs.follows = "nixpkgs";
  inputs."shell".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-ginger-v0_3_11"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-ginger-v0_3_11";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}