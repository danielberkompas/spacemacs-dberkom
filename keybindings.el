;; Autoindent
(global-set-key "\C-m" 'newline-and-indent)

;; Split windows
(key-chord-define evil-normal-state-map "vv" 'split-window-right)
(key-chord-define evil-normal-state-map "ss" 'split-window-below)

;; Exit normal mode with "jj"
;; TODO: Move this into the `dberkom` extension layer
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(define-key evil-insert-state-map "j" #'cofi/maybe-exit)
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "" ?k)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
         (delete-char -1)
         (set-buffer-modified-p modified)
         (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

;; Split Navigation
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)

;; NeoTree
(define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)
(add-hook 'neotree-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
   (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "ma") 'neotree-create-node)
   (define-key evil-normal-state-local-map (kbd "md") 'neotree-delete-node)
   (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
   (define-key evil-normal-state-local-map (kbd "mm") 'neotree-rename-node)
))

;; Projectile Find File
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
(define-key evil-visual-state-map (kbd "C-p") 'projectile-find-file)
(define-key evil-motion-state-map (kbd "C-p") 'projectile-find-file)

;; Make "_" a word in all syntax modes
(modify-syntax-entry (string-to-char "_") "w" (standard-syntax-table))
(modify-syntax-entry (string-to-char "_") "w" text-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" lisp-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" emacs-lisp-mode-syntax-table)
