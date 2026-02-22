{ pkgs, config, ... }:
{
  programs.mbsync.enable = true; # Fetching
  programs.msmtp.enable = true; # Sending

  programs.mu.enable = true;

  accounts.email = {
    maildirBasePath = "Mail";

    accounts = {
      "Mailbox" = {
        primary = true;
        address = "jamesyuli@mailbox.org";
        userName = "jamesyuli@mailbox.org";
        realName = "Yu Li";
        passwordCommand = "cat ~/.key/mailbox";

        imap = {
          host = "imap.mailbox.org";
          port = 993;
        };

        smtp = {
          host = "smtp.mailbox.org";
          port = 465;
        };

        mbsync = {
          enable = true;
          create = "both";
          remove = "both";
          expunge = "both";
          extraConfig.channel = {
            Sync = "All";
          };
        };

        msmtp.enable = true;

        mu.enable = true;
      };
    };
  };
}
