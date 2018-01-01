GaiView = require './gai-view'
{CompositeDisposable} = require 'atom'

module.exports = Gai =
  gaiView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @gaiView = new GaiView(state.gaiViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @gaiView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
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
    console.log 'Gai was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
