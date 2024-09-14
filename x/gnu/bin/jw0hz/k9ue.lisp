;; name project k9ue
;; name program k9
;; name extension ue
;; name version 1.0.0

;; description
;; A simple command-line tool for managing and sending emails using the K9mail email client.

;; homepage
;; https://github.com/k9mail/k9

;; license
;; MIT

;; author
;; rivendell <rivendell@github.com>

;; categories
;; Email, Command-Line Interface

;; keywords
;; k9, email, command-line, tool

;; depends
;; k9mail

;; build-depends
;; base >= 4.11 && < 5
;; optparse-applicative >= 0.15 && < 0.19

;; source-repository head
;; type: git
;; location: https://github.com/rivendell/k9ue.git

(main IO ()
(executable
  (name k9ue)
  (source-files "src/*.hs")
  (depends-on base optparse-applicative k9mail)
  (main-is Main.hs)
  (build-depends base optparse-applicative k9mail)))


(library
  (name k9ue)
  (source-files "src/*.hs")
  (depends-on base optparse-applicative k9mail))


(test-suite test-k9ue
  (type Check)
  (main-is Test.hs)
  (source-files "test/*.hs")
  (depends-on base optparse-applicative k9mail)
  (build-depends base optparse-applicative k9mail))

(executable
  (name k9)
  (source-files "src/K9.hs")
  (depends-on base optparse-applicative k9ue)
  (build-depends base optparse-applicative k9ue))

 (test-suite test-k9
   (type Check)
   (main-is Test.hs)
   (source-files "test/*.hs")
   (depends-on base optparse-applicative k9ue)
   (build-depends base optparse-applicative k9ue))
   (test-module "K9.SendEmail"
      (test-suite "send_email"
        (test-case "sends_email_successfully"
         (let ((subject "Test email")
               (body "This is a test email.")
               (recipient "test@example.com"))
           (with-mock-k9mail
            (mock-send-email subject body recipient)
            (assertEqual (send-email subject body recipient) "Email sent successfully."))))))

 (test-module "K9.ReceiveEmails"
      (test-suite "receive_emails"
        (test-case "receives_emails_successfully"
         (with-mock-k9mail
          (mock-receive-emails)
          (assertEqual (receive-emails) '("Test email 1", "Test email 2"))))))
          (test-case "handles_empty_inbox"
           (with-mock-k9mail
            (mock-receive-emails)
            (assertEqual (receive-emails) '())))
            (test-case "handles_error_in_inbox"
             (with-mock-k9mail
              (mock-receive-emails-error)
              (assertEqual (receive-emails) '("Error retrieving emails."))))
              (test-module "K9.DeleteEmail"
                  (test-suite "delete_email"
                    (test-case "deletes_email_successfully"
                     (with-mock-k9mail
                      (mock-delete-email "Test email 1")
                      (assertEqual (delete-email "Test email 1") "Email deleted successfully.")))))

 (test-module "K9.UpdateEmail"
                  (test-suite "update_email"
                    (test-case "updates_email_successfully"
                     (with-mock-k9mail
                      (mock-update-email "Test email 1" "New subject" "New body")
                      (assertEqual (update-email "Test email 1" "New subject" "New body") "Email updated successfully.")))))
                      (test-module "K9.SearchEmails"
                          (test-suite "search_emails"
                            (test-case "searches_emails_successfully"
                             (with-mock-k9mail
                              (mock-search-emails "test")
                              (assertEqual (search-emails "test") '("Test email 1", "Test email 2"))))))
                              (test-case "handles_empty_search_results"
                               (with-mock-k9mail
                                (mock-search-emails "test")
                                (assertEqual (search-emails "test") '()))
                                (test-case "handles_error_in_search"
                                 (with-mock-k9mail
                                  (mock-search-emails-error)
                                  (assertEqual (search-emails "test") '("Error searching emails.")))))
                                  (test-module "K9.ArchiveEmail"
                                      (test-suite "archive_email"
                                        (test-case "archives_email_successfully"
                                         (with-mock-k9mail
                                          (mock-archive-email "Test email 1")
                                          (assertEqual (archive-email "Test email 1") "Email archived successfully.")))))
                                          (test-module "K9.UnarchivedEmail"
                                              (test-suite "unarchived_email"
                                                (test-case "unarchived_email_successfully"
                                                 (with-mock-k9mail
                                                  (mock-unarchive-email "Test email 1")
                                                  (assertEqual (unarchive-email "Test email 1") "Email unarchived successfully.")))))
                                                  (test-module "K9.FlagEmail"
                                                      (test-suite "flag_email"
                                                        (test-case "flags_email_successfully"
                                                         (with-mock-k9mail
                                                          (mock-flag-email "Test email 1")
                                                          (assertEqual (flag-email "Test email 1") "Email flagged successfully.")))))
                                                          (test-module "K9.Unf-lagEmail"
                                                          (test-suite "unf-lag_email"
                                                            (test-case "unf-lags_email_successfully"
                                                             (with-mock-k9mail
                                                              (mock-unflag-email "Test email 1")
                                                              (assertEqual (unflag-email "Test email 1") "Email flagged successfully.")))))




