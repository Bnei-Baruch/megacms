class ArticleCell < Cell::Rails

  def display(args)
    @widget = args[:widget]
    @test = 'kuku' + ' widget: ' + @widget.inspect
    render
  end

end
