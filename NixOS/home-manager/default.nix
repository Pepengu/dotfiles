_:
let
    username = "daniil";
in {
    imports =  [
        (import ./modules)
    ];

    home = {
        inherit username;
        homeDirectory = "/home/${username}";

        stateVersion = "24.11";
    };
}


