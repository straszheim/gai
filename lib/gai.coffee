GaiView = require './gai-view'
{CompositeDisposable} = require 'atom'

module.exports = Gai =
  gaiView: null
  editor: null
  subscriptions: null

  activate: (state) ->

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    opener = atom.workspace.addOpener (uri) =>
      if uri === 'atom://gai'
        return new GaiView

    @subscriptions = new CompositeDisposable


    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'gai:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @gaiView.destroy()

  serialize: ->
    gaiViewState: @gaiView.serialize()

  toggle: ->
    atom.workspace.toggle 'atom://gai'


get_buffer_for = (path) ->
  eds = atom.workspace.getTextEditors()
  console.log eds
  for e in eds
    console.log e.buffer.file.path
    if e.buffer.file.path == path
      return e.buffer



hackit = () ->
  b = get_buffer_for('/home/troy/proj/atom/repos/gai/something.gai')
  console.log b
  for id, ml of b.markerLayers
    console.log id, ml

hackit()
