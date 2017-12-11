# Vespa front-page
The Vespa.ai front page

## Add announcement banner
In order to add a (temporary) announcement banner on top of the page, add the following HTML segment below the first ```<nav class="navbar navbar-default navbar-fixed-top">``` element in [header.html](_includes/header.html):

```html
<!-- Announcement banner -->
<div class="container" id="banner">
  <div class="row">
    <div class="text-center" id="banner">
      <span>MAJOR ANNOUNCEMENT: Add some interesting (short) text here. <a href="http://blog.vespa.ai/">Read more...</a></span>
    </div>
  </div>
</div>
```

The end result will look like this:
![Announcement screenshot](_announcement_sample.png)
