module ApplicationHelper

  def request_admin_bar(page)
    content_for :admin_bar do
      javascript_tag do
        <<-JS
        $(document).ready(function() {
          $.get('#{frontend_admin_admin_bar_path(page)}', function(data){
            $('body').prepend(data);
          })
        });
        JS
      end
    end
  end
end
