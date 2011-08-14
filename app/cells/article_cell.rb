class ArticleCell < Cell::Rails

  def display
    @test = 'kuku'
    render
  end

end
