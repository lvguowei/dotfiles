(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
             ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Refresh
(unless package-archive-contents
  (package-refresh-contents))

;; Bootstrap Quelpa
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))

(require 'quelpa-use-package)

(setq use-package-always-ensure t)

(org-babel-load-file (expand-file-name "~/.emacs.d/emacs_config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(pdf-tools eshell-toggle web-beautify company-c-headers lsp-java lsp-treemacs lsp-ivy lsp-ui lsp-mode eldoc-box company flycheck yasnippet-snippets yasnippet emojify counsel swiper doom-modeline doom-themes undo-tree magit deft smartparens rainbow-delimiters quelpa-use-package origami org-superstar ob-restclient ob-kotlin default-text-scale all-the-icons-dired ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
