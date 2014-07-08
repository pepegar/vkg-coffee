homeDir = (process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE) + "/.vim/bundle/"

module.exports =
  vimawesomeApi: "http://vimawesome.com/api/plugins"
  vimBundlesPath: homeDir
