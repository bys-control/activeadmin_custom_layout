# ActiveadminCustomLayout
[![Gem Version](https://badge.fury.io/rb/activeadmin_custom_layout.svg)](https://badge.fury.io/rb/activeadmin_custom_layout)

This gem allows to change the default layout of ActiveAdmin without monkey patching its code. You can just use standard application layout templates to organize where ActiveAdmin layout sections should be rendered.

## Usage

### Available exports

The following layout template will render the default ActiveAdmin layout:

```HTML
<!DOCTYPE html>
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
			<%= yield :unsupported_browser %>
			<div class="header" id="header"> <%#= yield :header %>
				<%= yield :site_title %>
				<%= yield :global_navigation %>
				<%= yield :utility_navigation %>
			</div>
			<div class="title_bar" id="title_bar"> <%#= yield :title_bar %>
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
			<div id="active_admin_content" class="<%= (content_for? :sidebar) ? "with_sidebar" : "without_sidebar" %>" >
				<%= yield :main_content %>
				<%= yield :sidebar %>
			</div>
			<%= yield :footer %>
		</div>
	</body>
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

Execute installer:
```bash
rails g activeadmin_custom_layout:install
```

You can override the default gem layout by creating your own using the structure shown above and then modify `/app/admin/custom_base_controller.rb` file to reference the new layout.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
