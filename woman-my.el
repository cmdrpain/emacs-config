(autoload 'woman "woman" "Browse man pages." t)

(setq woman-manpath '("/usr/man" "/usr/share/man" "/usr/local/share/man" "/usr/opt/qt/man")
      woman-manpath-man-regexp "[Mm][Aa][Nn][1-9]"
      woman-use-own-frame nil
      woman-cache-filename "~/.emacs.d/woman_cache.el"
      woman-cache-level 3)

