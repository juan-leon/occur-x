;;; occur-x.el --- 

;; Copyright (C) 2002, 2004, 2012  Free Software Foundation, Inc.

;; Author: Juan-Leon Lahoz <juanleon1@gmail.com>
;; Keywords: occur, search
;; Version: 0.1

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:


;;; Code:

(defun occur-x--set-margin ()
  (and linum-mode (linum-mode -1))
  (setq left-margin-width
        (progn
          (goto-char (point-max))
          (forward-line -1)
          (- (- (re-search-forward "[0-9]") (search-forward ":")))))
  (set-window-buffer (get-buffer-window) (current-buffer)))

(defun occur-x--linenums-to-margin()
  (save-excursion
    (om--set-margin)
    (goto-char (point-min))
    (forward-line 1)
    (let ((inhibit-read-only t))
      (while (not (eobp))
        (let ((p (point)))
          (when (re-search-forward "^\s*\\([0-9]+\\):" (+ 10 p) t)
            (let ((n (propertize
                      (format (concat "%" (number-to-string
                                           left-margin-width) "s")
                              (match-string 1))
                      'face 'linum))
                  (o (make-overlay p p)))
              (delete-region p (point))
              (overlay-put o 'before-string
                           (propertize " " 'display 
                                       `((margin left-margin) ,n))))))
        (forward-line 1))))

;;;; ChangeLog:

;; 2013-06-10  Juan-Leon Lahoz <juanleon1@gmail.com>
;; 
;; 	* occur-x: New package.
;; 

(provide 'occur-x)
;;; memory-usage.el ends here
