;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package) ;; You might already have this line
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; --------------------------------------------------------------------
;; custom config
;; --------------------------------------------------------------------
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(auto-save-timeout 20)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(global-display-line-numbers-mode t)
 '(global-highlight-thing-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode nil)
 '(line-number-mode nil)
 '(neo-window-position (quote right))
 '(package-selected-packages
   (quote
    (highlight-thing yafolding helm-swoop swoop xclip company-irony flycheck-irony irony-eldoc irony google-this highlight-symbol helm fish-mode ace-window racket-mode magit company neotree ivy swiper counsel yasnippet-snippets diminish buffer-move move-text org d-mode csv-mode exec-path-from-shell youdao-dictionary yasnippet rainbow-delimiters multiple-cursors julia-mode expand-region)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(truncate-lines t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "darkmagenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "darkgreen"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "purple"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

;; run in head
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(set-language-environment "UTF-8")

;; --------------------------------------------------------------------
;; light config
;; --------------------------------------------------------------------

(require 'move-text)
(move-text-default-bindings)

(require 'expand-region)

(if (eq system-type 'windows-nt)
    (setq file-name-coding-system 'gbk))

(require 'neotree)
(setq neo-smart-open t)

(setq highlight-thing-case-sensitive-p t)

(add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))

(yas-global-mode t)

;; company-mode ------------------------------------------------------
(setq company-dabbrev-ignore-case nil)
(setq company-dabbrev-downcase nil)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)

;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends
;;     '(company-yasnippet company-dabbrev)))

;; hooks here ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.geo\\'" . c-mode))

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'julia-mode-hook 'whitespace-mode)
(add-hook 'julia-mode-hook 'company-mode)
(add-hook 'julia-mode-hook #'rainbow-delimiters-mode)

(add-hook 'text-mode-hook 'company-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook #'rainbow-delimiters-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

;; --------------------------------------------------------------------
;; heavy config
;; --------------------------------------------------------------------

(setq scroll-conservatively most-positive-fixnum)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; org-mode setting --------------------------------------------------
(setq org-startup-truncated t)
(require 'org)
(setq org-tags-column -70)
(setq org-src-fontify-natively t)  ;; make the code block syntax highlighted
(setq org-todo-keywords '((sequence "TODO" "DOING" "|" "DONE" "ABORT")))

;; youdao config
;; Enable Cache
(setq url-automatic-caching t)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")


;; pyim
;; (require 'pyim)
;; (require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
;; (pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
;; (setq default-input-method "pyim")


;; dlang
(add-hook 'd-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)))

;; c and cpp
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'c-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)))

;;;;;;;;;;;;;;;;;;;;;;;; better defaults ;;;;;;;;;;;;;;;;;;;;;;;
(auto-save-visited-mode 1)
(async-bytecomp-package-mode 1)
(xclip-mode 1)

(setq inhibit-startup-screen t)
(save-place-mode 1)
(setq load-prefer-newer t)
(electric-pair-mode 1)
(global-auto-revert-mode 1)

(size-indication-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode -1)

(setq-default fill-column 80)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 20 4))


(setq-default whitespace-style '(face
                                 lines-tail
                                 tabs
                                 tab-mark))
(setq-default whitespace-line-column 120)


(delete-selection-mode 1)

;; (set-face-attribute 'region nil :background "#666")

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

; mode-line ;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq-default mode-line-format
;;       (list
;;        " %l:%c <-- " ;; value of current line number
;;        mode-line-percent-position
;;        " | "
;;        mode-line-mule-info
;;        mode-line-client
;;        mode-line-modified
;;        " | %b | " ;; value of current buffer name
;;        mode-line-modes
;;        mode-line-misc-info
;;        "| Time is everything"))

(setq-default mode-line-format
      (list
       " %3c " ;; value of current line number
       "%20b " ;; value of current buffer name
       mode-line-percent-position
       " "
       mode-line-mule-info
       mode-line-client
       mode-line-modified
       " COURAGE & FAITH " mode-line-modes
       mode-line-misc-info))


;;;;;;;;;;;;;;;;;;;;;; my function ;;;;;;;;;;;;;;;;;;;;;;

(defun walker-next-element ()
  (interactive)
  (re-search-forward "^ *\\([a-z]+\\)\\|& +\\([a-z]+\\)" nil t))

(defvar lineq 1 "1 for filling column to 70 and 2 for filling column to 1000")

(defun walker-line-switch ()
  "for a smooth line editing experience"
  (interactive)
  (cond ((= lineq 1)
         (set-fill-column 50)
         (fill-paragraph)
         (setq lineq 2)
         (message "wrap line for editing"))
        ((= lineq 2)
         (set-fill-column 1000)
         (fill-paragraph)
         (setq lineq 1)
         (message "stretch line for collaboration"))))

(defun walker-font ()
  (interactive)
  (set-frame-font
   "-simp-Hack-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset (font-spec :family "Noto Sans SC Regular" :size 16))))

(defun walker-font-large ()
  (interactive)
  (set-frame-font
   "-simp-Hack-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset (font-spec :family "Noto Sans SC Regular" :size 20))))

(defun walker-swiper-point ()
  (interactive)
  (swiper (format "\\<%s\\>" (thing-at-point 'symbol))))

(defun walker-shell-on-buffer ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: ")))

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))

(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

(defun describe-last-function()
  (interactive)
  (describe-function last-command))

(defun walker-join-line ()
  (interactive)
  (next-line)
  (join-line))

(defun walker-fix-fonts ()
  (interactive)
  (mapc
   (lambda (face)
     (set-face-attribute face nil
                         ;; :family (if (string= system-type "darwin")
                         ;;             "Menlo"
                         ;;             "Inconsolata")
                         :width 'normal
                         :height 1.0
                         :weight 'normal
                         :underline nil
                         :slant 'normal))
   (remove 'default (face-list))))

;; latex mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar walker-turquoise
  (defface walker-turquoise
    '((t :foreground "black"
         :background "turquoise"
         ))
    "face for user defined variables."
    :group 'latex-mode))

(defvar walker-tomato
  (defface walker-tomato
    '((t :foreground "black"
         :background "tomato"))
    "face for user defined varaibles."
    :group 'latex-mode))

(defvar walker-green
  (defface walker-green
    '((t :foreground "black"
         :background "brightgreen"))
    "face for user defined varaibles."
    :group 'latex-mode))


(defun walker-latex-hook ()
  (font-lock-add-keywords nil
                          '(("^\\\\title{.*}\\|^\\\\chapter.*}" (0 walker-turquoise))
                            ("^\\\\section.*}" (0 walker-turquoise))
                            ("^\\\\subsection.*}" (0 walker-tomato))
                            ("^\\\\subsubsection.*}" (0 walker-green)))))

(add-hook 'latex-mode-hook 'walker-latex-hook)
(add-hook 'latex-mode-hook 'flyspell-mode)

;;;;;;;;;;;;;;; my keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (ivy-mode 1)
;; (counsel-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers nil)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-s") 'swiper)

;; ------------------------------------------------------
;; productive matters all
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-s") #'swiper)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; ------------------------------------------------------

(global-set-key (kbd "M-/") 'comment-line)

(global-set-key (kbd "M-j") 'walker-join-line)

(global-set-key (kbd "<f2>") #'helm-mini)

(global-set-key (kbd "<f3>") 'helm-mark-ring)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)

(global-set-key (kbd "<f7>") 'ispell-word)
(global-set-key (kbd "<f8>") 'neotree-toggle)

(global-set-key (kbd "<f9>") 'company-dabbrev)

(global-set-key (kbd "<f10>") 'highlight-symbol)
(global-set-key (kbd "S-<f10>") 'highlight-symbol-remove-all)

(global-set-key (kbd "C-c d") 'kill-this-buffer)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-q") 'set-mark-command)

;; set to nil
(global-set-key (kbd "C-SPC") nil)
(global-set-key (kbd "C-;") nil)
(global-set-key (kbd "C-x C-b") nil)
(global-set-key (kbd "C-x b") nil)
(global-set-key (kbd "<f4>") nil)

;; color ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-background 'mode-line "dark orange")
(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line-inactive "black")
;; (set-face-attribute 'region nil :background "black")

(set-face-background 'hl-line "khaki")
;; (set-face-background 'hl-line "color-84")

;; --------------------------------------------------------------
(walker-font)
(message "**********************SAFE NOW!*************************")
