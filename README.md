# WAI Dynamic Planning

This is the repository for the WAI dynamic planning resource. Developed by the
[Education and Outreach Working Group (EOWG)](//w3.org/WAI/EO/) with support from the [WAI-DEV project](//w3.org/WAI/DEV/), co-funded by the European Commission <abbr title="Information Society Technologies">IST</abbr> Programme. 

You can find the current draft state of the document on [this Github Pages site][GHPage]

## Contributing

The main content pages of this resource are written in Kramdown, a version of Markdown. The [Quick Reference](http://kramdown.gettalong.org/quickref.html) provides details on how to write content.

Editing a page on GitHub works just like a Wiki.

Either browse to the page in this repository and edit the file there, or visit the page in [Github Page][GHPage] and click on "Fork and Edit" at the bottom of the page.

You can start editing right away. If you get the following note, this is expected behavior:

> You are editing a file in a project you do not have write access to. We are forking this project for you (if one does not yet exist) to write your proposed changes to. Submitting a change to this file will write it to a new branch in your fork so you can send a pull request.

It is technical for “All right, make your edits, we make sure you can send them in as a proposal!”

Don’t forget to add some descriptive text at the bottom that comments your change. Try to be concise. Click the “Propose this change” button to continue. Then you get another comment field, you can write down your motivation for the change here. Once you click “Send pull request” the editor of the notified of your proposal and may adopt it.

### Helpers

The resource also provides some additional convenience helpers that are used to structure the code. These are included in the page using the following code:

```
{::nomarkdown}
<%= activity %>
{:/}
```

The following elements are available:

<dl>
  <dt>expand_collapse</dt>
    <dd>Includes the markup for the expand all/collapse all controls, and adds in the markup to support expand/collapse within activities.</dd>

  <dt>activity</dt>
    <dd>Starts an activity block within a page. To end the block use <code><%= activity :end %></code></dd>

  <dt>activity_body</dt>
    <dd>Indicates where the body of the activity begins. The body is collapsed by default and expanded when the activity head is clicked.</dd>

  <dt>support</dt>
    <dd>Starts the block for supporting material. To end the block use <code><%= support :end %></code></dd>

  <dt>more_information</dt>
    <dd>Starts the block for adding additional resources that add more information to this resource. To end the block use <code><%= more_information :end %></code></dd>

  <dt>related</dt>
    <dd>Starts the block for adding activities that are related to an activity. To end the block use <code><%= related :end %></code></dd>

  <dt>w3url</dt>
    <dd>Creates a link to a W3C page so that when this resource is hosted on GitHub Pages, the links work as expected, but when it is deployed into w3.org, the links are all relative. Use this in combination with the <code>link_to</code> helper:</dd>
    <dd><code><%= link_to "WAI Homepage", (w3url '/WAI/') %></code></dd>
</dl>

## Structure

This resource is built using [Middleman](//middlemanapp.com/), a static site generation tool. To build a local version of the resource do the following:

* [Install Middleman](//middlemanapp.com/basics/install/)
* Clone a version of this repository
* Install the repository dependencies, `bundle install` in the repository root directory
* Run the server, `middleman server`

This resource uses GitHub Pages to display the current draft version. If you wish to update this version from your cloned repository you need to:

* Build a GitHub version of the resource

    `BUILD_FOR_GITHUB=1 middleman build`

* Deploy the build to GitHub

    `middleman deploy`

The environment variable, `BUILD_FOR_GITHUB`, is used to configure URLs. So when the resource is deployed on GitHub Pages the URLs are absolute, and when built for production deployment in w3.org they are relative.

## Deploying to live

The following steps are required in order to deploy this to the live w3.org environment. In order to deploy you will need the permissions to update content on w3.org.

1. Build deployable version.

    `middleman build`

    This builds the content into the local `build` directory. Removing the `BUILD_FOR_GITHUB` means that the URLs in the pages built will be relative rather than absolute and that the `excol.js` scripts will be handled in a different way.

2. CVS update the `/WAI/impl`, `/WAI/users`, and `/WAI/Policy` directories in your local version of the repository.

3. Copy the following from the `build` directory to the local CVS `impl` directory:

    * index.html
    * acknowledgements.html
    * implement.html
    * initiate.html
    * plan.html
    * sustain.html
    * stylesheets/*
    * javascripts/*

4. If necessary, edit the Planning & Implementing overview and make changes to the `/WAI/managing.html` page.

5. If necessary, edit the following pages and update the navigation to change the label and URL for this resource:

    * /WAI/managing.html
    * /WAI/Policy/harmon.html
    * /WAI/Policy/Overview.html
    * /WAI/impl/pol.html
    * /WAI/impl/improving.html
    * /WAI/users/involving.html
    * /WAI/impl/software.html

6. Commit all the changes to the w3.org CVS repository.

7. Check all the pages to find the typo that you accidentally left in.

[GHPage]: https://w3c.github.io/wai-dynamic-planning/