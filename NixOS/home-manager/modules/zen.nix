_: {
  programs.zen-browser = let
    mkLockedAttrs = builtins.mapAttrs (_: value: {
        Value = value;
        Status = "locked";
        });
  in {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Preferences = mkLockedAttrs {
        "zen.widget.linux.transparency" = true;
        "browser.tabs.allow_transparent_browser" = true;
        "devtools.debugger.remote-enabled" = true;
        "devtools.chrome.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        #1a1b26aa
      };
    };
  };
}
