_:
let
    username = "daniil";
in {
    imports =  [
        (import ./modules)
        (import ./backgrounds)
    ];

    home = {
        inherit username;
        homeDirectory = "/home/${username}";

        stateVersion = "24.11";
    };
}


