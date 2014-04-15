module ApplicationHelper

  def usernav
    links = ''
    if @current_user
      links +=
        "<li>Welcome back #{@current_user.username}</li>
        <li>#{link_to('sign out', login_path, :method => :delete, :confirm => 'Are you sure you wish to log out?')}</li>"
    elsif @current_user && @current_user.admin
      links +=
        "<li>YOU HAVE ADMIN RIGHTS</li>"
    else
      links +=
        "<li>#{link_to('login', '/' )}</li>"
    end
    links
  end

end



<% if flash[:notice].present? %> 
  <h2><%= flash[:notice] %></h2> 
<% end %>
<form action='/login' method="post">
<%= form_tag login_path, :method => :post do %>
  <%= label_tag :username %>
  <%= text_field_tag :username, params[:username] %>
  <%= label_tag :password %>
  <%= password_field_tag :password %>
  <%= submit_tag "Sign in", class: "btn btn-large btn-primary" %>
<% end %>