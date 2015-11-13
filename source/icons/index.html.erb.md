---
title: Overview
status: editors-draft
layout: main
---

{:.introduction}
This resource explores activities that are important when planning for accessibility. Activities are grouped by when in a project or program they might be considered. Each activity provides information on what is required and points to related resources that explore the activity further.

{::nomarkdown}
<ul class="grid">
<% cycle = 'even' %>
<% data.structure_with_icons.each do |tag, section| %>
  <% cycle = (cycle == 'odd' ? 'even' : 'odd') %>
  <li class="<%= cycle %>"><p><%= link_to "<i class='fa fa-#{section.icon}'></i>#{section.label}", "/#{tag}/index.html" %></p>
    <p><%= section.description %></p>
    <ul style="list-style-type: none;">
    <% section.activities.each do |activity, activity_data| %>
      <li><%= link_to "<i class='fa fa-#{activity_data.icon}'></i>" + title(activity), "/icons/#{tag}/#{activity}.html" %></li>
    <% end %>
    </ul>
  </li>
<% end %>
</ul>
{:/}