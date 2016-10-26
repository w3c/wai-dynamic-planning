---
title: Overview
first_published: October 2002
layout: main
---

This guide outlines activities to help you integrate accessibility throughout the web production process. This applies to individual projects and on an organizational level. These activities are not necessarily carried out in sequence, and are ideally repeated over time to continually raise the level of accessibility capability.

{::nomarkdown}<%= link_to "Web Accessibility First Aid: Approaches for Interim Repairs", (w3url '/WAI/impl/improving') %>{:/}, provides guidance on more immediate remediation of accessibility barriers.

{::nomarkdown}
<ul class="grid">
<% cycle = 'even' %>
<% data.structure.each do |tag, section| %>
  <% cycle = (cycle == 'odd' ? 'even' : 'odd') %>
  <li class="<%= cycle %>"><p><%= link_to "<i class='fa fa-#{section.icon}'></i>#{section.label}", "#{tag}.html" %></p>
    <p><%= section.description %></p>
    <ul>
    <% section.activities.each do |activity| %>
      <li><%= link_to title(activity), "#{tag}.html##{activity}" %></li>
    <% end %>
    </ul>
  </li>
<% end %>
</ul>
{:/}
