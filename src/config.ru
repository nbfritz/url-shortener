require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("src")
if ENV["IS_OFFLINE"]
  loader.enable_reloading
  require 'listen'
  Listen.to("src") { loader.reload }.start
end
loader.setup

run App.freeze.app
