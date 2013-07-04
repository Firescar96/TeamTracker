


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>iOS/Drop Down Menu 3.5/DropDown Menu Storyboard/UIDropDownMenu.h at master · addimage/iOS · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="https://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/modules/logos_page/Octocat.png">
    <link rel="assets" href="https://a248.e.akamai.net/assets.github.com/">
    <link rel="xhr-socket" href="/_sockets" />
    
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="aQL9wlPbrQS3zJIv8VqRU0Fc/OwGKu263Y9j+Oe7ntQ=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-ea411d39186fc4af5c44122551ef7c2fb888f2bd.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-03ce9163c360a7e897f75aede112913e8bb3b528.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-1f72571b966545f4e27481a3b0ebbeeed4f2f139.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-ffa633000167d2fe52aebee0aa148bf43e0f327f.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="f05acda9e765ce66f2a22f210f1e0b24">

        <link data-pjax-transient rel='permalink' href='/addimage/iOS/blob/7400e4b68e0e6641a41136740a09e272d509c78b/Drop%20Down%20Menu%203.5/DropDown%20Menu%20Storyboard/UIDropDownMenu.h'>
  <meta property="og:title" content="iOS"/>
  <meta property="og:type" content="githubog:gitrepository"/>
  <meta property="og:url" content="https://github.com/addimage/iOS"/>
  <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-user-420.png"/>
  <meta property="og:site_name" content="GitHub"/>
  <meta property="og:description" content="iOS libraries"/>

  <meta name="description" content="iOS libraries" />

  <meta content="3297834" name="octolytics-dimension-user_id" /><meta content="addimage" name="octolytics-dimension-user_login" /><meta content="7669806" name="octolytics-dimension-repository_id" /><meta content="addimage/iOS" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="7669806" name="octolytics-dimension-repository_network_root_id" /><meta content="addimage/iOS" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/addimage/iOS/commits/master.atom" rel="alternate" title="Recent Commits to iOS:master" type="application/atom+xml" />

  </head>


  <body class="logged_out page-blob macintosh vis-public env-production ">

    <div class="wrapper">
      
      
      

      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
      <a class="button primary" href="/signup">Sign up</a>
      <a class="button" href="/login?return_to=%2Faddimage%2FiOS%2Fblob%2Fmaster%2FDrop%2520Down%2520Menu%25203.5%2FDropDown%2520Menu%2520Storyboard%2FUIDropDownMenu.h">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">


      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="addimage/iOS"
      data-branch="master"
      data-sha="206b2cc27acb2afc3d0e5cd0eee7d110b8b5d904"
  >

    <input type="hidden" name="nwo" value="addimage/iOS" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>


      


          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


    <li>
      <a href="/login?return_to=%2Faddimage%2FiOS"
        class="minibutton with-count js-toggler-target star-button entice tooltipped upwards"
        title="You must be signed in to use this feature" rel="nofollow">
        <span class="octicon octicon-star"></span>Star
      </a>
      <a class="social-count js-social-count" href="/addimage/iOS/stargazers">
        3
      </a>
    </li>
    <li>
      <a href="/login?return_to=%2Faddimage%2FiOS"
        class="minibutton with-count js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/addimage/iOS/network" class="social-count">
        13
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/addimage" class="url fn" itemprop="url" rel="author"><span itemprop="title">addimage</span></a></span
          ><span class="repohead-name-divider">/</span><strong
          ><a href="/addimage/iOS" class="js-current-repository js-repo-home-link">iOS</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">

      <div class="repository-with-sidebar repo-container
            ">

          <div class="repository-sidebar">

              

<div class="repo-nav repo-nav-full js-repository-container-pjax js-octicon-loaders">
  <div class="repo-nav-contents">
    <ul class="repo-menu">
      <li class="tooltipped leftwards" title="Code">
        <a href="/addimage/iOS" class="js-selected-navigation-item selected" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /addimage/iOS">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/addimage/iOS/issues" class="js-selected-navigation-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /addimage/iOS/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>1</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests"><a href="/addimage/iOS/pulls" class="js-selected-navigation-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /addimage/iOS/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>




    </ul>
    <div class="repo-menu-separator"></div>
    <ul class="repo-menu">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/addimage/iOS/pulse" class="js-selected-navigation-item " data-pjax="true" data-selected-links="pulse /addimage/iOS/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/addimage/iOS/graphs" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_graphs repo_contributors /addimage/iOS/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/addimage/iOS/network" class="js-selected-navigation-item js-disable-pjax" data-selected-links="repo_network /addimage/iOS/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    </ul>

  </div>
</div>


              <div class="only-with-full-nav">

                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/addimage/iOS.git" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/addimage/iOS.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/addimage/iOS" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/addimage/iOS" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>



<p class="clone-options">You can clone with
    <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
    <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>,
  and <a href="https://help.github.com/articles/which-remote-url-should-i-use">other methods.</a>
</p>

  <a href="http://mac.github.com" class="minibutton sidebar-button">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>



                  <a href="/addimage/iOS/archive/master.zip"
                     class="minibutton sidebar-button"
                     title="Download this repository as a zip file"
                     rel="nofollow">
                    <span class="octicon octicon-cloud-download"></span>
                    Download ZIP
                  </a>

              </div>
          </div>

          <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
            


<!-- blob contrib key: blob_contributors:v21:0185199d3ecc0e85004ca9ff5214c0da -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:0185199d3ecc0e85004ca9ff5214c0da -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/addimage/iOS/find/master" data-pjax data-hotkey="t" style="display:none">Show File Finder</a>

<div class="file-navigation">
  


<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/addimage/iOS/blob/master/Drop%20Down%20Menu%203.5/DropDown%20Menu%20Storyboard/UIDropDownMenu.h" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" rel="nofollow" title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/addimage/iOS" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">iOS</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/addimage/iOS/tree/master/Drop%20Down%20Menu%203.5" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">Drop Down Menu 3.5</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/addimage/iOS/tree/master/Drop%20Down%20Menu%203.5/DropDown%20Menu%20Storyboard" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">DropDown Menu Storyboard</span></a></span><span class="separator"> / </span><strong class="final-path">UIDropDownMenu.h</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="Drop Down Menu 3.5/DropDown Menu Storyboard/UIDropDownMenu.h" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/c69998388c5211b4b7939c4a70e853d0?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/addimage" rel="author">addimage</a></span>
    <time class="js-relative-date" datetime="2013-01-17T08:37:17-08:00" title="2013-01-17 08:37:17">January 17, 2013</time>
    <div class="commit-title">
        <a href="/addimage/iOS/commit/996387fb3cb7d16224b427cb46164050b70120c1" class="message" data-pjax="true">Minor updates to header text</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/c69998388c5211b4b7939c4a70e853d0?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/addimage">addimage</a>
        </li>
      </ul>
    </div>
  </div>


<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>88 lines (66 sloc)</span>
        <span>3.38 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
              <a class="minibutton js-entice" href=""
                 data-entice="You must be signed in and on a branch to make or propose changes">Edit</a>
          <a href="/addimage/iOS/raw/master/Drop%20Down%20Menu%203.5/DropDown%20Menu%20Storyboard/UIDropDownMenu.h" class="button minibutton " id="raw-url">Raw</a>
            <a href="/addimage/iOS/blame/master/Drop%20Down%20Menu%203.5/DropDown%20Menu%20Storyboard/UIDropDownMenu.h" class="button minibutton ">Blame</a>
          <a href="/addimage/iOS/commits/master/Drop%20Down%20Menu%203.5/DropDown%20Menu%20Storyboard/UIDropDownMenu.h" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
      </div><!-- /.actions -->

    </div>
                <div class="blob-wrapper data type-objective-c js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="c1">//</span></div><div class='line' id='LC2'><span class="c1">//  UIDropDownMenu.m</span></div><div class='line' id='LC3'><span class="c1">//  DropDownMenu</span></div><div class='line' id='LC4'><span class="c1">//</span></div><div class='line' id='LC5'><span class="c1">//  Created on 30/03/2012.</span></div><div class='line' id='LC6'><span class="c1">//  Updated by Add Image on 17/01/2013.</span></div><div class='line' id='LC7'><span class="c1">//  Copyright (c) 2013 Add Image</span></div><div class='line' id='LC8'><span class="c1">//</span></div><div class='line' id='LC9'><span class="c1">//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the &quot;Software&quot;), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:</span></div><div class='line' id='LC10'><br/></div><div class='line' id='LC11'><span class="c1">//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.</span></div><div class='line' id='LC12'><br/></div><div class='line' id='LC13'><span class="c1">//  THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.</span></div><div class='line' id='LC14'><br/></div><div class='line' id='LC15'><span class="c1">//</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'><span class="cp">#import &lt;Foundation/Foundation.h&gt;</span></div><div class='line' id='LC18'><br/></div><div class='line' id='LC19'><span class="k">@protocol</span> <span class="nc">UIDropDownMenuDelegate</span> <span class="o">&lt;</span><span class="n">NSObject</span><span class="o">&gt;</span></div><div class='line' id='LC20'><span class="k">@optional</span></div><div class='line' id='LC21'><span class="o">-</span> <span class="p">(</span><span class="kt">void</span><span class="p">)</span> <span class="n">DropDownMenuDidChange</span><span class="o">:</span><span class="p">(</span><span class="n">NSString</span> <span class="o">*</span><span class="p">)</span><span class="n">identifier</span> <span class="o">:</span><span class="p">(</span><span class="n">NSString</span> <span class="o">*</span><span class="p">)</span><span class="n">ReturnValue</span><span class="p">;</span></div><div class='line' id='LC22'><span class="k">@end</span></div><div class='line' id='LC23'><br/></div><div class='line' id='LC24'><span class="k">@interface</span> <span class="nc">UIDropDownMenu</span> : <span class="nc">NSObject</span> <span class="o">&lt;</span><span class="n">UITextFieldDelegate</span><span class="p">,</span> <span class="n">UITableViewDelegate</span><span class="p">,</span> <span class="n">UITableViewDataSource</span><span class="p">,</span> <span class="n">UIGestureRecognizerDelegate</span><span class="o">&gt;</span></div><div class='line' id='LC25'><span class="p">{</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// general objects</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UITableView</span> <span class="o">*</span><span class="n">dropdownTable</span><span class="p">;</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UIView</span> <span class="o">*</span><span class="n">parentView</span><span class="p">;</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UITapGestureRecognizer</span> <span class="o">*</span><span class="n">singleTapGestureRecogniser</span><span class="p">;</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">NSString</span> <span class="o">*</span><span class="n">identifiername</span><span class="p">;</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">//Object which the menu is attached to</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">NSObject</span> <span class="o">*</span><span class="n">targetObject</span><span class="p">;</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// possible object types</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UITextField</span> <span class="o">*</span><span class="n">selectedTextField</span><span class="p">;</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UIButton</span> <span class="o">*</span><span class="n">selectedButton</span><span class="p">;</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// arrays</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">NSMutableArray</span> <span class="o">*</span><span class="n">titleArray</span><span class="p">;</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">NSMutableArray</span> <span class="o">*</span><span class="n">valueArray</span><span class="p">;</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// styling variables</span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kt">BOOL</span> <span class="n">ScaleToFitParent</span><span class="p">;</span></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kt">int</span> <span class="n">menuWidth</span><span class="p">;</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kt">int</span> <span class="n">rowHeight</span><span class="p">;</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UIColor</span> <span class="o">*</span><span class="n">textColor</span><span class="p">;</span></div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UIColor</span> <span class="o">*</span><span class="n">backgroundColor</span><span class="p">;</span></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">UIColor</span> <span class="o">*</span><span class="n">borderColor</span><span class="p">;</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// value to return when clicked</span></div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">NSString</span> <span class="o">*</span><span class="n">selectedValue</span><span class="p">;</span></div><div class='line' id='LC54'><br/></div><div class='line' id='LC55'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC56'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kt">id</span> <span class="o">&lt;</span><span class="n">UIDropDownMenuDelegate</span><span class="o">&gt;</span> <span class="n">delegate</span><span class="p">;</span></div><div class='line' id='LC57'><span class="p">}</span></div><div class='line' id='LC58'><br/></div><div class='line' id='LC59'><br/></div><div class='line' id='LC60'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UITableView</span> <span class="o">*</span><span class="n">dropdownTable</span><span class="p">;</span></div><div class='line' id='LC61'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UIView</span> <span class="o">*</span><span class="n">parentView</span><span class="p">;</span></div><div class='line' id='LC62'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UITapGestureRecognizer</span> <span class="o">*</span><span class="n">singleTapGestureRecogniser</span><span class="p">;</span></div><div class='line' id='LC63'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">NSString</span> <span class="o">*</span><span class="n">identifiername</span><span class="p">;</span></div><div class='line' id='LC64'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">NSObject</span> <span class="o">*</span><span class="n">targetObject</span><span class="p">;</span></div><div class='line' id='LC65'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UITextField</span> <span class="o">*</span><span class="n">selectedTextField</span><span class="p">;</span></div><div class='line' id='LC66'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UIButton</span> <span class="o">*</span><span class="n">selectedButton</span><span class="p">;</span></div><div class='line' id='LC67'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">NSMutableArray</span> <span class="o">*</span><span class="n">titleArray</span><span class="p">;</span></div><div class='line' id='LC68'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">NSMutableArray</span> <span class="o">*</span><span class="n">valueArray</span><span class="p">;</span></div><div class='line' id='LC69'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UIColor</span> <span class="o">*</span><span class="n">textColor</span><span class="p">;</span></div><div class='line' id='LC70'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UIColor</span> <span class="o">*</span><span class="n">backgroundColor</span><span class="p">;</span></div><div class='line' id='LC71'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">UIColor</span> <span class="o">*</span><span class="n">borderColor</span><span class="p">;</span></div><div class='line' id='LC72'><span class="k">@property</span> <span class="p">(</span><span class="n">nonatomic</span><span class="p">)</span> <span class="kt">BOOL</span> <span class="n">ScaleToFitParent</span><span class="p">;</span></div><div class='line' id='LC73'><span class="k">@property</span> <span class="p">(</span><span class="n">nonatomic</span><span class="p">)</span> <span class="kt">int</span> <span class="n">menuWidth</span><span class="p">;</span></div><div class='line' id='LC74'><span class="k">@property</span> <span class="p">(</span><span class="n">nonatomic</span><span class="p">)</span> <span class="kt">int</span> <span class="n">rowHeight</span><span class="p">;</span></div><div class='line' id='LC75'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">,</span> <span class="n">nonatomic</span><span class="p">)</span> <span class="n">NSString</span> <span class="o">*</span><span class="n">selectedValue</span><span class="p">;</span></div><div class='line' id='LC76'>&nbsp;</div><div class='line' id='LC77'><br/></div><div class='line' id='LC78'><span class="k">@property</span> <span class="p">(</span><span class="n">retain</span><span class="p">)</span> <span class="kt">id</span> <span class="n">delegate</span><span class="p">;</span></div><div class='line' id='LC79'><span class="k">@property</span> <span class="p">(</span><span class="n">assign</span><span class="p">)</span> <span class="kt">id</span> <span class="o">&lt;</span><span class="n">UIDropDownMenuDelegate</span><span class="o">&gt;</span> <span class="n">DropDownMenuDelegate</span><span class="p">;</span></div><div class='line' id='LC80'><br/></div><div class='line' id='LC81'><br/></div><div class='line' id='LC82'><br/></div><div class='line' id='LC83'><span class="k">-</span> <span class="p">(</span><span class="kt">id</span><span class="p">)</span> <span class="nf">initWithIdentifier:</span><span class="p">(</span><span class="n">NSString</span> <span class="o">*</span><span class="p">)</span><span class="nv">identifier</span><span class="p">;</span></div><div class='line' id='LC84'><span class="k">-</span><span class="p">(</span><span class="kt">void</span><span class="p">)</span><span class="nf">makeMenu:</span><span class="p">(</span><span class="n">NSObject</span> <span class="o">*</span><span class="p">)</span><span class="nv">targetObject</span> <span class="nf">targetView:</span><span class="p">(</span><span class="n">UIView</span> <span class="o">*</span><span class="p">)</span><span class="nv">tview</span><span class="p">;</span></div><div class='line' id='LC85'><span class="k">-</span><span class="p">(</span><span class="kt">void</span><span class="p">)</span><span class="nf">selectedObjectClicked:</span><span class="p">(</span><span class="kt">id</span><span class="p">)</span><span class="nv">sender</span><span class="p">;</span></div><div class='line' id='LC86'><span class="k">-</span><span class="p">(</span><span class="kt">void</span><span class="p">)</span><span class="nf">dismissMenu</span><span class="p">;</span></div><div class='line' id='LC87'><span class="k">@end</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;">
    <button type="submit" class="button">Go</button>
  </form>
</div>
          </div>
        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div>
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">Developer</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>
    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2013 <span title="0.04276s from fe2.rs.github.com">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/addimage/iOS/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

    
    <span id='server_response_time' data-time='0.04312' data-host='fe2'></span>
    
  </body>
</html>

