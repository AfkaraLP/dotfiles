// Config docs:
//
//   https://glide-browser.app/config
//
// API reference:
//
//   https://glide-browser.app/api
//
// Default config files can be found here:
//
//   https://github.com/glide-browser/glide/tree/main/src/glide/browser/base/content/plugins
//
// Most default keymappings are defined here:
//
//   https://github.com/glide-browser/glide/blob/main/src/glide/browser/base/content/plugins/keymaps.mts
//
// Try typing `glide.` and see what you can do!

glide.keymaps.set("normal", "<leader>t", async () => { /*Opens a new tab*/
  await glide.excmds.execute("tab_new")
})

glide.keymaps.set("normal", "<left>", async () => { await glide.excmds.execute("tab_prev") })
glide.keymaps.set("normal", "<right>", async () => { await glide.excmds.execute("tab_next") })

glide.o.hint_chars = "ashtioen"
glide.o.hint_size = "16px"

glide.autocmds.create("UrlEnter", /(www\.)?youtube\.com/, ({ url, tab_id }) => {
  glide.keymaps.set("normal", "<up>", () => {
    glide.content.execute(() => {
      let speedForwardButton = document.getElementById("button-fast");
      if (speedForwardButton) {
        speedForwardButton.click();
      }
    }, { tab_id })
  })

  glide.keymaps.set("normal", "<down>", () => {
    glide.content.execute(() => {
      let slowDownButton = document.getElementById("button-slow");
      if (slowDownButton) {
        slowDownButton.click();
      }
    }, { tab_id })
  })
})
