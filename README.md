# ActiveadminCustomLayout
Short description and motivation.

## Usage

### Available exports

```HTML
<html>
  <head>
  	<%= yield :title %>
    <%= yield :stylesheets %>
    <%= yield :javascripts %>
    <%= yield :favicon %>
    <%= yield :meta_tags %>
    <%= yield :favicon %>
    <%= csrf_meta_tag %>
  </head>
  <body class="<%= yield :body_classes %>" >
  <div id="wrapper">
	  unsupported_browser
	  <div id="header"> <%#= yield :header %>
			<%= yield :site_title %>
			<%= yield :global_navigation %>
			<%= yield :utility_navigation %>
	  </div>
	  <div id="title_bar"> <%#= yield :title_bar %>
	  	<div id="titlebar_left">
          <%= yield :breadcrumb %>
          <%= yield :title_tag %>
	  	</div>
	  	<div id="titlebar_right">
          <%= yield :action_items %>
	  	</div>
	  </div>
	  <%#= yield :page_content %>
	  <%= yield :flash_messages %>
	  <div id="active_admin_content">
			<%= yield :main_content %>
			<%= yield :sidebar %>
	  </div>
	  <%= yield :footer %>
  </div>
</html>
```

When rendering the index view:
```HTML
<div class="table_tools"> <%#= yield :table_tools %>
	<%= yield :index_batch_actions %>
	<%= yield :index_scopes %>
	<%= yield :index_index_list %>
</div>
<%= yield :index_collection %>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activeadmin_custom_layout'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activeadmin_custom_layout
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
