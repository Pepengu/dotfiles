{pkgs, ...}: {
   gtk = {
       enable = true;

       iconTheme = {
           package = pkgs.kora-icon-theme;
           name = "kora";
       };
   };

   qt = {
       enable = true;
   };
}
