;;; editing config

(setq-default truncate-lines           t   ; truncate line
              tab-width                4   ; tab width
              indent-tabs-mode         nil ; no use tab
              find-file-visit-truename t)  ; visit truename

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

;; auto insert
(auto-insert-mode t)
(eval-after-load "yasnippet"
  '(progn
     (custom-set-variables '(auto-insert-alist '(())))
     (dolist (mode '(html-mode cperl-mode))
       (define-auto-insert mode (lambda () (insert "template") (yas/expand))))))

;; auto-complete
;; (auto-install-batch "auto-complete development version")
(require 'auto-complete-config)
(global-auto-complete-mode t)
(custom-set-variables
 '(ac-use-menu-map           t)
 '(ac-dictionary-directories '("~/.emacs.d/etc/ac-dict")))
(define-key ac-menu-map (kbd "C-n")   'ac-next)
(define-key ac-menu-map (kbd "C-p")   'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)

;; smartchr
;; (auto-install-from-url "https://raw.github.com/imakado/emacs-smartchr/master/smartchr.el")
(require 'smartchr)
(define-key global-map (kbd "=")  (smartchr '(" = " "=")))
(define-key global-map (kbd "(")  (smartchr '("(`!!')" "(")))
(define-key global-map (kbd "{")  (smartchr '("{`!!'}" "{")))
(define-key global-map (kbd "[")  (smartchr '("[`!!']" "[")))
(define-key global-map (kbd "<")  (smartchr '("<`!!'>" "<")))
(define-key global-map (kbd ">")  (smartchr '(">" " => ")))
(define-key global-map (kbd "'")  (smartchr '("'`!!''" "'")))
(define-key global-map (kbd "\"") (smartchr '("\"`!!'\"" "\"")))

;; uniquify
;; set to "bar/mumble/name" style
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; dired
(require 'dired)
(define-key dired-mode-map (kbd "r")   'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-o") nil)

;; grep
(setq grep-command "ack --nogroup ")

;; isearch
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; recentf
;; (auto-install-from-emacswiki "recentf-ext.el")
(require 'recentf-ext)
(setq recentf-max-saved-items 200)

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)