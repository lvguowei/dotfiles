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

(setq use-package-ensure-function 'quelpa)

(require 'quelpa-use-package)

(setq use-package-always-ensure t)

(org-babel-load-file (expand-file-name "~/.emacs.d/emacs_config.org"))

;; Custom stuff starting from here
