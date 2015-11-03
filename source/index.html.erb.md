---
title: Overview
status: editors-draft
layout: main
---

{:.introduction}
This resource explores activities that are important when planning for accessibility. Activities are grouped by when in a project or program they might be considered. Each activity provides information on what is required and points to related resources that explore the activity further.

{::nomarkdown}
<ul class="grid">
<% data.structure.each do |tag, section| %>
  <li><p><%= link_to "<i class='fa fa-#{section.icon}'></i>#{section.label}", "/#{tag}/index.html" %></p>
    <p><%= section.description %></p>
    <ul>
    <% section.activities.each do |activity_tag, activity| %>
      <li><%= link_to activity.label, "/#{tag}/#{activity_tag}.html" %></li>
    <% end %>
    </ul>
  </li>
<% end %>
</ul>
{:/}