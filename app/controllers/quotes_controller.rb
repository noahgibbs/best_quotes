class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render :quote, :obj => quote, :ua => ua
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels.",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def post_test
    raise "NOT A POST!" unless env["REQUEST_METHOD"] == "POST"

    "Params: #{request.params.inspect}"
  end
end
