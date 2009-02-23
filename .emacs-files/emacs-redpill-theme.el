(eval-when-compile
  (require 'color-theme))

(defun color-theme-redpill ()
  "Deep Blue theme with #242424 background."
  (interactive)
  (color-theme-deep-blue)
  (let ((color-theme-is-cumulative t))
  (color-theme-install
   '(color-theme-redpill
     ;; General
      ((background-color . "#242424"))
    ))
  )
)

;;-- Test
(color-theme-redpill)
