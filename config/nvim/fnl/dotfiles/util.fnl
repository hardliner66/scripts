(module dotfiles.util
  {autoload {nvim aniseed.nvim}})

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn nnoremap [from to]
  (nvim.set_keymap
    :n
    (.. "<leader>" from)
    (.. ":" to "<cr>")
    {:noremap true}))

(defn noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

(defn noremaps [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true :silent true}))

(defn nnoremap [from to]
  "Sets a mapping in normal mode with {:noremap true}."
  (noremap :n from to))

(defn nnoremaps [from to]
  "Sets a mapping in normal mode with {:noremap true}."
  (noremaps :n from to))

(defn cmd [...]
  (let [lines [...]] 
    (nvim.exec (table.concat lines "\n") false)
  ))
