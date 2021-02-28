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

;; Custom stuff starting from here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elegance org-superstar-mode which-key yasnippet-snippets yasnippet ob-restclient restclient deft ob-racket web-beautify company-irony-c-headers semantic/bovine/gcc cmake-ide flycheck company rainbow-delimiters all-the-icons-dired ace-window default-text-scale doom-modeline undo-tree use-package magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:height 0.85))))
 '(mode-line-inactive ((t (:height 0.85)))))
