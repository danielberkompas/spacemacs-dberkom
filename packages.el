;;; packages.el --- dberkom Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar dberkom-packages
  '(
    alchemist
    key-chord
    ujelly-theme
    pbcopy
    mmm-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar dberkom-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function dberkom/init-<package-dberkom>
;;

(defun dberkom/init-ujelly-theme ()
  "Initialize theme"
  )

(defun dberkom/init-pbcopy ()
  "Initialize pbcopy"
  (require 'pbcopy)
  (turn-on-pbcopy)
  )

(defun dberkom/init-mmm-mode ()
  (require 'mmm-mode)
  (mmm-add-classes
    '((markdown-ruby
      :submode ruby-mode
      :face mmm-declaration-submode-face
      :front "^```\s?ruby[\n\r]"
      :back "^```$")))

  (mmm-add-classes
    '((markdown-elixir
      :submode elixir-mode
      :face mmm-declaration-submode-face
      :front "^```\s?elixir[\n\r]"
      :back "^```$")))

  (mmm-add-classes
    '((markdown-js
      :submode js-mode
      :face mmm-declaration-submode-face
      :front "^```\s?javascript[\n\r]"
      :back "^```$")))

  (setq mmm-global-mode 't)
  (setq mmm-submode-decoration-level 0)

  (add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-ruby))
  (add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-elixir))
  (add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-js))
  )

(defun dberkom/init-emacs-elixir ()
  "Initialize emacs-elixir"
  (require 'elixir-mode)
  )

(defun dberkom/init-my-package ()
  "Initialize my package"
  )

(defun dberkom/init-alchemist ()
  "Initialize the alchemist package"
  (require 'alchemist)
  )

(defun dberkom/init-key-chord ()
  "Initialize the key-chord package"
  (require 'key-chord)
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.075)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

