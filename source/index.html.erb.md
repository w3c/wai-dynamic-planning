---
title: Overview
status: editors-draft
layout: main
---

This resource explores activities that are important when planning for accessibility. Activities are grouped by when in a project or program they might be considered. Each activity provides information on what is required and points to related resources that explore the activity further.

{::nomarkdown}<%= link_to "Improving the Accessibility of Your Website", (w3url '/WAI/impl/improving') %>{:/} provides more tactical guidance on fixing accessibility barriers in existing websites.

{::nomarkdown}
<ul class="grid">
<% cycle = 'even' %>
<% data.structure.each do |tag, section| %>
  <% cycle = (cycle == 'odd' ? 'even' : 'odd') %>
  <li class="<%= cycle %>"><p><%= link_to "<i class='fa fa-#{section.icon}'></i>#{section.label}", "#{tag}/" %></p>
    <p><%= section.description %></p>
    <ul>
    <% section.activities.each do |activity| %>
      <li><%= link_to title(activity), "#{tag}/##{activity}" %></li>
    <% end %>
    </ul>
  </li>
<% end %>
</ul>
{:/}