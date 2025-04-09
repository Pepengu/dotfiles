_: {
specialArgs = [inherit ${system}];
    packages.${system} = {
        rust = «toolchain»; 

# Nightly toolchain of a specific date.
        "rust-nightly_${yyyy}-${mm}-${dd}" = «toolchain»;
# Alias to `rust-nightly_${latest-nightly-yyyy-mm-dd}`.
        rust-nightly = «toolchain»; 

# Beta toolchain of a specific date.
        "rust-beta_${yyyy}-${mm}-${dd}" = «toolchain»;
# Alias to `rust-beta_${latest-beta-yyyy-mm-dd}`.
        rust-beta = «toolchain»; 
    };
}
