-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2020 at 02:02 PM
-- Server version: 5.7.28-0ubuntu0.19.04.2
-- PHP Version: 7.2.24-0ubuntu0.19.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wgblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` text COLLATE utf8mb4_unicode_ci,
  `file` text COLLATE utf8mb4_unicode_ci,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `keywords`, `category`, `photo`, `description`, `post`, `file`, `published`, `deleted_at`, `created_at`, `updated_at`, `author`, `author_email`, `slug`) VALUES
(7, 'If this method exists on your model, the Slugify engine can be customized before slugging occurs', 'If this ,method ex,ists on y,our model,, the Slugify, engine can b, customized befo,e slugg,ing o,ccu,rs', '1', 'image_2019_12_31T06_08_44_532Z_1578842275.png', 'If this method exists on your model, the Slugify engine can be customized before slugging occurs. This might be where you change the character mappings that are used, or alter language files, etc..\r\n\r\nYou can customize the engine on a per-model and per-attribute basis (maybe your model has two slug fields, and one of them needs customization).', '<ul>\r\n<li>f this method exists on your model, the Slugify engine can be customized before slugging occurs. This might be where you change the character mappings that are used, or alter language files, etc..</li>\r\n</ul>\r\n<p>You can customize the engine on a per-model and per-attribute basis (maybe your model has two slug fields, and one of them needs customization).</p>\r\n<p>Take a look at&nbsp;<code>tests/Models/PostWithCustomEngine.php</code>&nbsp;for an example.</p>\r\n<h3><a id=\"user-content-scopewithuniqueslugconstraints\" class=\"anchor\" href=\"https://github.com/cviebrock/eloquent-sluggable#scopewithuniqueslugconstraints\" aria-hidden=\"true\"></a>scopeWithUniqueSlugConstraints</h3>\r\n<div class=\"highlight highlight-text-html-php\">\r\n<pre><span class=\"pl-s1\"><span class=\"pl-c\">/**</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * <span class=\"pl-k\">@param</span> \\Illuminate\\Database\\Eloquent\\Builder $query</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * <span class=\"pl-k\">@param</span> \\Illuminate\\Database\\Eloquent\\Model $model</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * <span class=\"pl-k\">@param</span> string $attribute</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * <span class=\"pl-k\">@param</span> array $config</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * <span class=\"pl-k\">@param</span> string $slug</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * <span class=\"pl-k\">@return</span> \\Illuminate\\Database\\Eloquent\\Builder</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> */</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-k\">public</span> <span class=\"pl-k\">function</span> <span class=\"pl-en\">scopeWithUniqueSlugConstraints</span>(<span class=\"pl-c1\">Builder</span> <span class=\"pl-smi\">$query</span>, <span class=\"pl-c1\">Model</span> <span class=\"pl-smi\">$model</span>, <span class=\"pl-smi\">$attribute</span>, <span class=\"pl-smi\">$config</span>, <span class=\"pl-smi\">$slug</span>)</span>\r\n<span class=\"pl-s1\">{</span>\r\n<span class=\"pl-s1\">    <span class=\"pl-k\">...</span></span>\r\n<span class=\"pl-s1\">}</span></pre>\r\n</div>\r\n<p>If this scope exists on your model, then it will also be applied to the query used to determine if a given slug is unique. The arguments passed to the scope are:</p>\r\n<ul>\r\n<li><code>$model</code>&nbsp;-- the object being slugged</li>\r\n<li><code>$attribute</code>&nbsp;-- the slug field being generated,</li>\r\n<li><code>$config</code>&nbsp;-- the configuration array for the given model and attribute</li>\r\n<li><code>$slug</code>&nbsp;-- the \"base\" slug (before any unique suffixes are applied)</li>\r\n</ul>\r\n<p>Feel free to use these values anyway you like in your query scope. As an example, look at&nbsp;<code>tests/Models/PostWithUniqueSlugConstraints.php</code>&nbsp;where the slug is generated for a post from it\'s title, but the slug is scoped to the author. So Bob can have a post with the same title as Pam\'s post, but both will have the same slug.</p>\r\n<h3><a id=\"user-content-scopefindsimilarslugs\" class=\"anchor\" href=\"https://github.com/cviebrock/eloquent-sluggable#scopefindsimilarslugs\" aria-hidden=\"true\"></a>scopeFindSimilarSlugs</h3>\r\n<div class=\"highlight highlight-text-html-php\">\r\n<pre><span class=\"pl-s1\"><span class=\"pl-c\">/**</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> * Query scope for finding \"similar\" slugs, used to determine uniqueness.</span></span>\r\n<span class=\"pl-s1\"><span class=\"pl-c\"> *</span></span></pre>\r\n</div>', 'small-logo-black_32x32_1578842275.webp', 1, NULL, '2020-01-12 09:47:55', '2020-01-12 14:06:49', 'Test1 Codeclouds', 'admin@admin.com', 'if-this-method-exists-on-your-model-the-slugify-engine-can-be-customized-before-slugging-occurs'),
(8, 'Laravel 5: Display HTML with Blade', 'However,, the output i,s a raw st,ing inste,ad of ren,dered ,HTML. How do I dis,play HTML ,with ,,Blade in Lara,vel ,5?,', '2', NULL, 'However, the output is a raw string instead of rendered HTML. How do I display HTML with Blade in Laravel 5?', '<div id=\"answer-29254016\" class=\"answer accepted-answer\" data-answerid=\"29254016\">\r\n<div class=\"post-layout\">\r\n<div class=\"answercell post-layout--right\">\r\n<div class=\"post-text\">\r\n<p>You <strong>need</strong> to use</p>\r\n<pre class=\"lang-php prettyprint prettyprinted\"><code><span class=\"pun\">{!!</span><span class=\"pln\"> $text </span><span class=\"pun\">!!}</span></code></pre>\r\n<p>The string will auto escape when using&nbsp;<code>{{ $text }}</code>.</p>\r\n</div>\r\n<div class=\"grid mb0 fw-wrap ai-start jc-end gs8 gsy\"><time datetime=\"2015-03-25T11:09:54\"></time>\r\n<div class=\"grid--cell mr16\">\r\n<div class=\"post-menu\"><a class=\"js-share-link js-gps-track\" style=\"margin: 0px; padding: 0px 4px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 13px; vertical-align: baseline; box-sizing: inherit; text-decoration: none; color: #848d95; cursor: pointer; display: inline-block;\" title=\"short permalink to this answer\" href=\"https://stackoverflow.com/a/29254016/11776441\" data-gps-track=\"post.click({ item: 2, priv: -1, post_type: 2 })\" data-controller=\"se-share-sheet s-popover\" data-se-share-sheet-title=\"Share a link to this answer\" data-se-share-sheet-subtitle=\"(includes your user id)\" data-se-share-sheet-post-type=\"answer\" data-se-share-sheet-social=\"facebook twitter devto\" data-se-share-sheet-location=\"2\" data-s-popover-placement=\"bottom-start\" aria-controls=\"se-share-sheet-1\" data-action=\" s-popover#toggle se-share-sheet#preventNavigation s-popover:show-&gt;se-share-sheet#willShow s-popover:shown-&gt;se-share-sheet#didShow\">share</a><a class=\"suggest-edit-post js-gps-track\" title=\"revise and improve this post\" href=\"https://stackoverflow.com/posts/29254016/edit\" data-gps-track=\"post.click({ item: 6, priv: -1, post_type: 2 })\">edit</a></div>\r\n</div>\r\n<div class=\"post-signature grid--cell fl0\">\r\n<div class=\"user-info \">\r\n<div class=\"user-action-time\"><a class=\"js-gps-track\" title=\"show all edits to this post\" href=\"https://stackoverflow.com/posts/29254016/revisions\" data-gps-track=\"post.click({ item: 4, priv: -1, post_type: 2 })\">edited&nbsp;<span class=\"relativetime\" title=\"2018-12-25 05:50:54Z\">Dec 25 \'18 at 5:50</span></a></div>\r\n<div class=\"user-gravatar32\">\r\n<div class=\"gravatar-wrapper-32\"><img class=\"bar-sm\" src=\"https://www.gravatar.com/avatar/e704ae76f3286c3e7050cfe48c1e3a51?s=32&amp;d=identicon&amp;r=PG&amp;f=1\" alt=\"\" width=\"32\" height=\"32\" /></div>\r\n</div>\r\n<div class=\"user-details\"><a href=\"https://stackoverflow.com/users/3911632/chad\">Chad</a>\r\n<div class=\"-flair\"><span class=\"reputation-score\" dir=\"ltr\" title=\"reputation score \">1,282</span><span title=\"1 gold badge\" aria-hidden=\"true\"><span class=\"badgecount\">1</span></span><span class=\"v-visible-sr\">1 gold badge</span><span title=\"15 silver badges\" aria-hidden=\"true\"><span class=\"badgecount\">15</span></span><span class=\"v-visible-sr\">15 silver badges</span><span title=\"37 bronze badges\" aria-hidden=\"true\"><span class=\"badgecount\">37</span></span><span class=\"v-visible-sr\">37 bronze badges</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"post-signature grid--cell fl0\">\r\n<div class=\"user-info \">\r\n<div class=\"user-action-time\"><strong>answered</strong>&nbsp;<span class=\"relativetime\" title=\"2015-03-25 11:09:54Z\">Mar 25 \'15 at 11:09</span></div>\r\n<div class=\"user-gravatar32\">\r\n<div class=\"gravatar-wrapper-32\"><img class=\"bar-sm\" src=\"https://www.gravatar.com/avatar/c05892cf9f099568893e0af448b9c85e?s=32&amp;d=identicon&amp;r=PG&amp;f=1\" alt=\"\" width=\"32\" height=\"32\" /></div>\r\n</div>\r\n<div class=\"user-details\"><a href=\"https://stackoverflow.com/users/3792240/terry-low\">terry low</a>\r\n<div class=\"-flair\"><span class=\"reputation-score\" dir=\"ltr\" title=\"reputation score \">6,668</span><span title=\"1 gold badge\" aria-hidden=\"true\"><span class=\"badgecount\">1</span></span><span class=\"v-visible-sr\">1 gold badge</span><span title=\"9 silver badges\" aria-hidden=\"true\"><span class=\"badgecount\">9</span></span><span class=\"v-visible-sr\">9 silver badges</span><span title=\"11 bronze badges\" aria-hidden=\"true\"><span class=\"badgecount\">11</span></span><span class=\"v-visible-sr\">11 bronze badges</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"js-post-notices post-layout--full\">&nbsp;</div>\r\n<div class=\"post-layout--right\">\r\n<div id=\"comments-29254016\" class=\"comments js-comments-container bt bc-black-2 mt12 \" data-post-id=\"29254016\" data-min-length=\"15\">\r\n<ul class=\"comments-list js-comments-list\" data-remaining-comments-count=\"0\" data-canpost=\"false\" data-cansee=\"true\" data-comments-unavailable=\"false\" data-addlink-disabled=\"true\">\r\n<li id=\"comment-81037818\" class=\"comment js-comment \" data-comment-id=\"81037818\">\r\n<div class=\"js-comment-actions comment-actions\">\r\n<div class=\"comment-score js-comment-edit-hide\"><span class=\"cool\" title=\"number of \'useful comment\' votes received\">4</span></div>\r\n</div>\r\n<div class=\"comment-text js-comment-text-and-form\">\r\n<div class=\"comment-body js-comment-edit-hide\"><span class=\"comment-copy\">Here are the Laravel docs that mention this: \"If you do not want your data to be escaped, you may use the following syntax:&nbsp;<code>Hello, {!! $name !!}.</code>\"&nbsp;<a href=\"https://laravel.com/docs/5.5/blade#displaying-data\" rel=\"nofollow noreferrer\">laravel.com/docs/5.5/blade#displaying-data</a></span>&nbsp;&ndash;&nbsp;<a class=\"comment-user\" title=\"13,512 reputation\" href=\"https://stackoverflow.com/users/470749/ryan\">Ryan</a>&nbsp;<span class=\"comment-date\" dir=\"ltr\"><a class=\"comment-link\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade#comment81037818_29254016\"><span class=\"relativetime-clean\" title=\"2017-10-31 22:08:13Z\">Oct 31 \'17 at 22:08</span></a></span></div>\r\n</div>\r\n</li>\r\n<li id=\"comment-87145265\" class=\"comment js-comment \" data-comment-id=\"87145265\">\r\n<div class=\"js-comment-actions comment-actions\">\r\n<div class=\"comment-score js-comment-edit-hide\"><span class=\"cool\" title=\"number of \'useful comment\' votes received\">1</span></div>\r\n</div>\r\n<div class=\"comment-text js-comment-text-and-form\">\r\n<div class=\"comment-body js-comment-edit-hide\"><span class=\"comment-copy\">I am also wondering about what @Ryan mentioned. Is this not a security issue?</span>&nbsp;&ndash;&nbsp;<a class=\"comment-user\" title=\"9,137 reputation\" href=\"https://stackoverflow.com/users/80040/sanders\">sanders</a>&nbsp;<span class=\"comment-date\" dir=\"ltr\"><a class=\"comment-link\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade#comment87145265_29254016\"><span class=\"relativetime-clean\" title=\"2018-04-27 14:14:52Z\">Apr 27 \'18 at 14:14</span></a></span></div>\r\n</div>\r\n</li>\r\n<li id=\"comment-87669798\" class=\"comment js-comment \" data-comment-id=\"87669798\">\r\n<div class=\"js-comment-actions comment-actions\">\r\n<div class=\"comment-score js-comment-edit-hide\">&nbsp;</div>\r\n</div>\r\n<div class=\"comment-text js-comment-text-and-form\">\r\n<div class=\"comment-body js-comment-edit-hide\"><span class=\"comment-copy\">@sanders It quite likely is a security issue if&nbsp;<code>$text</code>&nbsp;contains user input and you did not escape this properly. For example,&nbsp;<code>$text = \'Hello <strong>\'.$_GET[\'name\'].\'</strong>\';</code>&nbsp;is dangerous because&nbsp;<code>$_GET[\'name\']</code>&nbsp;could include HTML, which would allow XSS. You could do&nbsp;<code>$text = \'Hello <strong>\'.htmlentities($_GET[\'name\']).\'</strong>\';</code>&nbsp;and would be safe.</span>&nbsp;&ndash;&nbsp;<a class=\"comment-user\" title=\"486 reputation\" href=\"https://stackoverflow.com/users/1433331/christopher-k\">Christopher K.</a>&nbsp;<span class=\"comment-date\" dir=\"ltr\"><a class=\"comment-link\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade#comment87669798_29254016\"><span class=\"relativetime-clean\" title=\"2018-05-14 09:28:22Z\">May 14 \'18 at 9:28</span></a></span></div>\r\n</div>\r\n</li>\r\n<li id=\"comment-90666094\" class=\"comment js-comment \" data-comment-id=\"90666094\">\r\n<div class=\"js-comment-actions comment-actions\">\r\n<div class=\"comment-score js-comment-edit-hide\">&nbsp;</div>\r\n</div>\r\n<div class=\"comment-text js-comment-text-and-form\">\r\n<div class=\"comment-body js-comment-edit-hide\"><span class=\"comment-copy\">this dose not do the whole trick! if I had something like&nbsp;<code></code>&nbsp;and I wanna show it in blade, It will look like this&nbsp;<code></code>. So the answer for me is @Praveen_Dabral \'s</span>&nbsp;&ndash;&nbsp;<a class=\"comment-user\" title=\"432 reputation\" href=\"https://stackoverflow.com/users/6211514/brahimm\">brahimm</a>&nbsp;<span class=\"comment-date\" dir=\"ltr\"><a class=\"comment-link\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade#comment90666094_29254016\"><span class=\"relativetime-clean\" title=\"2018-08-15 10:21:09Z\">Aug 15 \'18 at 10:21</span></a></span></div>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>\r\n<div id=\"comments-link-29254016\" data-rep=\"50\" data-reg=\"true\"><a class=\"js-add-link comments-link disabled-link\" title=\"Use comments to ask for more information or suggest improvements. Avoid comments like &ldquo;+1&rdquo; or &ldquo;thanks&rdquo;.\" role=\"button\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade\">add a comment</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<p><a name=\"32780405\"></a></p>\r\n<div id=\"answer-32780405\" class=\"answer\" data-answerid=\"32780405\">\r\n<div class=\"post-layout\">\r\n<div class=\"votecell post-layout--left\">\r\n<div class=\"js-voting-container grid fd-column ai-stretch gs4 fc-black-200\" data-post-id=\"32780405\"><button class=\"js-vote-up-btn grid--cell s-btn s-btn__unset c-pointer\" title=\"This answer is useful\" aria-pressed=\"false\" aria-label=\"up vote\" data-selected-classes=\"fc-theme-primary\"></button>\r\n<div class=\"js-vote-count grid--cell fc-black-500 fs-title grid fd-column ai-center\" data-value=\"53\">53</div>\r\n<button class=\"js-vote-down-btn grid--cell s-btn s-btn__unset c-pointer\" title=\"This answer is not useful\" aria-pressed=\"false\" aria-label=\"down vote\" data-selected-classes=\"fc-theme-primary\"></button></div>\r\n</div>\r\n<div class=\"answercell post-layout--right\">\r\n<div class=\"post-text\">\r\n<p>For laravel 5</p>\r\n<pre class=\"lang-php prettyprint prettyprinted\"><code><span class=\"pun\">{!!</span><span class=\"pln\">html_entity_decode</span><span class=\"pun\">(</span><span class=\"pln\">$text</span><span class=\"pun\">)!!}</span></code></pre>\r\n<p>Figured out through this&nbsp;<a href=\"https://laracasts.com/discuss/channels/general-discussion/rendering-html-from-database-table-to-view-blade-issue-or\" rel=\"noreferrer\">link</a>, see RachidLaasri answer</p>\r\n</div>\r\n<div class=\"grid mb0 fw-wrap ai-start jc-end gs8 gsy\"><time datetime=\"2015-09-25T10:42:52\"></time>\r\n<div class=\"grid--cell mr16\">\r\n<div class=\"post-menu\"><a class=\"js-share-link js-gps-track\" style=\"margin: 0px; padding: 0px 4px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 13px; vertical-align: baseline; box-sizing: inherit; text-decoration: none; color: #848d95; cursor: pointer; display: inline-block;\" title=\"short permalink to this answer\" href=\"https://stackoverflow.com/a/32780405/11776441\" data-gps-track=\"post.click({ item: 2, priv: -1, post_type: 2 })\" data-controller=\"se-share-sheet s-popover\" data-se-share-sheet-title=\"Share a link to this answer\" data-se-share-sheet-subtitle=\"(includes your user id)\" data-se-share-sheet-post-type=\"answer\" data-se-share-sheet-social=\"facebook twitter devto\" data-se-share-sheet-location=\"2\" data-s-popover-placement=\"bottom-start\" aria-controls=\"se-share-sheet-2\" data-action=\" s-popover#toggle se-share-sheet#preventNavigation s-popover:show-&gt;se-share-sheet#willShow s-popover:shown-&gt;se-share-sheet#didShow\">share</a><a class=\"suggest-edit-post js-gps-track\" title=\"revise and improve this post\" href=\"https://stackoverflow.com/posts/32780405/edit\" data-gps-track=\"post.click({ item: 6, priv: -1, post_type: 2 })\">edit</a></div>\r\n</div>\r\n<div class=\"post-signature grid--cell fl0\">\r\n<div class=\"user-info user-hover\">\r\n<div class=\"user-action-time\"><a class=\"js-gps-track\" title=\"show all edits to this post\" href=\"https://stackoverflow.com/posts/32780405/revisions\" data-gps-track=\"post.click({ item: 4, priv: -1, post_type: 2 })\">edited&nbsp;<span class=\"relativetime\" title=\"2017-07-18 11:16:53Z\">Jul 18 \'17 at 11:16</span></a></div>\r\n<div class=\"user-gravatar32\">\r\n<div class=\"gravatar-wrapper-32\"><img class=\"bar-sm\" src=\"https://i.stack.imgur.com/iXbyM.png?s=32&amp;g=1\" alt=\"\" width=\"32\" height=\"32\" /></div>\r\n</div>\r\n<div class=\"user-details\"><a href=\"https://stackoverflow.com/users/5447994/thamilan\">Thamilan</a>\r\n<div class=\"-flair\"><span class=\"reputation-score\" dir=\"ltr\" title=\"reputation score 11,435\">11.4k</span><span title=\"4 gold badges\" aria-hidden=\"true\"><span class=\"badgecount\">4</span></span><span class=\"v-visible-sr\">4 gold badges</span><span title=\"27 silver badges\" aria-hidden=\"true\"><span class=\"badgecount\">27</span></span><span class=\"v-visible-sr\">27 silver badges</span><span title=\"50 bronze badges\" aria-hidden=\"true\"><span class=\"badgecount\">50</span></span><span class=\"v-visible-sr\">50 bronze badges</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"post-signature grid--cell fl0\">\r\n<div class=\"user-info user-hover\">\r\n<div class=\"user-action-time\">answered&nbsp;<span class=\"relativetime\" title=\"2015-09-25 10:42:52Z\">Sep 25 \'15 at 10:42</span></div>\r\n<div class=\"user-gravatar32\">\r\n<div class=\"gravatar-wrapper-32\"><img class=\"bar-sm\" src=\"https://www.gravatar.com/avatar/9ba53a7b64c6c00ae0468271f79db124?s=32&amp;d=identicon&amp;r=PG&amp;f=1\" alt=\"\" width=\"32\" height=\"32\" /></div>\r\n</div>\r\n<div class=\"user-details\"><a href=\"https://stackoverflow.com/users/2189793/praveen-dabral\">Praveen Dabral</a>\r\n<div class=\"-flair\"><span class=\"reputation-score\" dir=\"ltr\" title=\"reputation score \">2,049</span><span title=\"4 gold badges\" aria-hidden=\"true\"><span class=\"badgecount\">4</span></span><span class=\"v-visible-sr\">4 gold badges</span><span title=\"23 silver badges\" aria-hidden=\"true\"><span class=\"badgecount\">23</span></span><span class=\"v-visible-sr\">23 silver badges</span><span title=\"41 bronze badges\" aria-hidden=\"true\"><span class=\"badgecount\">41</span></span><span class=\"v-visible-sr\">41 bronze badges</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"js-post-notices post-layout--full\">&nbsp;</div>\r\n<div class=\"post-layout--right\">\r\n<div id=\"comments-32780405\" class=\"comments js-comments-container bt bc-black-2 mt12 \" data-post-id=\"32780405\" data-min-length=\"15\">\r\n<ul class=\"comments-list js-comments-list\" data-remaining-comments-count=\"0\" data-canpost=\"false\" data-cansee=\"true\" data-comments-unavailable=\"false\" data-addlink-disabled=\"true\">\r\n<li id=\"comment-73566180\" class=\"comment js-comment \" data-comment-id=\"73566180\">\r\n<div class=\"js-comment-actions comment-actions\">\r\n<div class=\"comment-score js-comment-edit-hide\"><span class=\"cool\" title=\"number of \'useful comment\' votes received\">1</span></div>\r\n</div>\r\n<div class=\"comment-text js-comment-text-and-form\">\r\n<div class=\"comment-body js-comment-edit-hide\"><span class=\"comment-copy\">Thanks..its working..{!! html_entity_decode($data) !!}</span>&nbsp;&ndash;&nbsp;<a class=\"comment-user\" title=\"375 reputation\" href=\"https://stackoverflow.com/users/6371819/priyabrata-atha\">Priyabrata Atha</a>&nbsp;<span class=\"comment-date\" dir=\"ltr\"><a class=\"comment-link\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade#comment73566180_32780405\"><span class=\"relativetime-clean\" title=\"2017-04-06 07:29:08Z\">Apr 6 \'17 at 7:29</span></a></span></div>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>\r\n<div id=\"comments-link-32780405\" data-rep=\"50\" data-reg=\"true\"><a class=\"js-add-link comments-link disabled-link\" title=\"Use comments to ask for more information or suggest improvements. Avoid comments like &ldquo;+1&rdquo; or &ldquo;thanks&rdquo;.\" role=\"button\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade\">add a comment</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<p><a name=\"29254065\"></a></p>\r\n<div id=\"answer-29254065\" class=\"answer\" data-answerid=\"29254065\">\r\n<div class=\"post-layout\">\r\n<div class=\"votecell post-layout--left\">\r\n<div class=\"js-voting-container grid fd-column ai-stretch gs4 fc-black-200\" data-post-id=\"29254065\"><button class=\"js-vote-up-btn grid--cell s-btn s-btn__unset c-pointer\" title=\"This answer is useful\" aria-pressed=\"false\" aria-label=\"up vote\" data-selected-classes=\"fc-theme-primary\"></button>\r\n<div class=\"js-vote-count grid--cell fc-black-500 fs-title grid fd-column ai-center\" data-value=\"37\">37</div>\r\n<button class=\"js-vote-down-btn grid--cell s-btn s-btn__unset c-pointer\" title=\"This answer is not useful\" aria-pressed=\"false\" aria-label=\"down vote\" data-selected-classes=\"fc-theme-primary\"></button></div>\r\n</div>\r\n<div class=\"answercell post-layout--right\">\r\n<div class=\"post-text\">\r\n<p>You can try this:</p>\r\n<pre class=\"lang-php prettyprint prettyprinted\"><code><span class=\"pun\">{!!</span><span class=\"pln\"> $text </span><span class=\"pun\">!!}</span></code></pre>\r\n<p>You should have a look at:&nbsp;<a href=\"http://laravel.com/docs/5.0/upgrade#upgrade-5.0\" rel=\"noreferrer\">http://laravel.com/docs/5.0/upgrade#upgrade-5.0</a></p>\r\n</div>\r\n<div class=\"grid mb0 fw-wrap ai-start jc-end gs8 gsy\"><time datetime=\"2015-03-25T11:12:05\"></time>\r\n<div class=\"grid--cell mr16\">\r\n<div class=\"post-menu\"><a class=\"js-share-link js-gps-track\" style=\"margin: 0px; padding: 0px 4px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 13px; vertical-align: baseline; box-sizing: inherit; text-decoration: none; color: #848d95; cursor: pointer; display: inline-block;\" title=\"short permalink to this answer\" href=\"https://stackoverflow.com/a/29254065/11776441\" data-gps-track=\"post.click({ item: 2, priv: -1, post_type: 2 })\" data-controller=\"se-share-sheet s-popover\" data-se-share-sheet-title=\"Share a link to this answer\" data-se-share-sheet-subtitle=\"(includes your user id)\" data-se-share-sheet-post-type=\"answer\" data-se-share-sheet-social=\"facebook twitter devto\" data-se-share-sheet-location=\"2\" data-s-popover-placement=\"bottom-start\" aria-controls=\"se-share-sheet-3\" data-action=\" s-popover#toggle se-share-sheet#preventNavigation s-popover:show-&gt;se-share-sheet#willShow s-popover:shown-&gt;se-share-sheet#didShow\">share</a><a class=\"suggest-edit-post js-gps-track\" title=\"revise and improve this post\" href=\"https://stackoverflow.com/posts/29254065/edit\" data-gps-track=\"post.click({ item: 6, priv: -1, post_type: 2 })\">edit</a></div>\r\n</div>\r\n<div class=\"post-signature grid--cell fl0\">\r\n<div class=\"user-info \">\r\n<div class=\"user-action-time\"><a class=\"js-gps-track\" title=\"show all edits to this post\" href=\"https://stackoverflow.com/posts/29254065/revisions\" data-gps-track=\"post.click({ item: 4, priv: -1, post_type: 2 })\">edited&nbsp;<span class=\"relativetime\" title=\"2018-01-12 01:32:06Z\">Jan 12 \'18 at 1:32</span></a></div>\r\n<div class=\"user-gravatar32\">\r\n<div class=\"gravatar-wrapper-32\"><img class=\"bar-sm\" src=\"https://i.stack.imgur.com/z5AzI.png?s=32&amp;g=1\" alt=\"\" width=\"32\" height=\"32\" /></div>\r\n</div>\r\n<div class=\"user-details\"><a href=\"https://stackoverflow.com/users/1402846/pang\">Pang</a>\r\n<div class=\"-flair\"><span class=\"reputation-score\" dir=\"ltr\" title=\"reputation score \">7,918</span><span title=\"16 gold badges\" aria-hidden=\"true\"><span class=\"badgecount\">16</span></span><span class=\"v-visible-sr\">16 gold badges</span><span title=\"68 silver badges\" aria-hidden=\"true\"><span class=\"badgecount\">68</span></span><span class=\"v-visible-sr\">68 silver badges</span><span title=\"108 bronze badges\" aria-hidden=\"true\"><span class=\"badgecount\">108</span></span><span class=\"v-visible-sr\">108 bronze badges</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"post-signature grid--cell fl0\">\r\n<div class=\"user-info user-hover\">\r\n<div class=\"user-action-time\">answered&nbsp;<span class=\"relativetime\" title=\"2015-03-25 11:12:05Z\">Mar 25 \'15 at 11:12</span></div>\r\n<div class=\"user-gravatar32\">\r\n<div class=\"gravatar-wrapper-32\"><img class=\"bar-sm\" src=\"https://i.stack.imgur.com/lNUl6.png?s=32&amp;g=1\" alt=\"\" width=\"32\" height=\"32\" /></div>\r\n</div>\r\n<div class=\"user-details\"><a href=\"https://stackoverflow.com/users/978690/rap-2-h\">rap-2-h</a>\r\n<div class=\"-flair\"><span class=\"reputation-score\" dir=\"ltr\" title=\"reputation score 17,998\">18k</span><span title=\"15 gold badges\" aria-hidden=\"true\"><span class=\"badgecount\">15</span></span><span class=\"v-visible-sr\">15 gold badges</span><span title=\"95 silver badges\" aria-hidden=\"true\"><span class=\"badgecount\">95</span></span><span class=\"v-visible-sr\">95 silver badges</span><span title=\"174 bronze badges\" aria-hidden=\"true\"><span class=\"badgecount\">174</span></span><span class=\"v-visible-sr\">174 bronze badges</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"js-post-notices post-layout--full\">&nbsp;</div>\r\n<div class=\"post-layout--right\">\r\n<div id=\"comments-link-29254065\" data-rep=\"50\" data-reg=\"true\"><a class=\"js-add-link comments-link disabled-link\" title=\"Use comments to ask for more information or suggest improvements. Avoid comments like &ldquo;+1&rdquo; or &ldquo;thanks&rdquo;.\" role=\"button\" href=\"https://stackoverflow.com/questions/29253979/laravel-5-display-html-with-blade\">add a comment</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<p><a name=\"42548459\"></a></p>\r\n<div id=\"answer-42548459\" class=\"answer\" data-answerid=\"42548459\">\r\n<div class=\"post-layout\">\r\n<div class=\"votecell post-layout--left\">\r\n<div class=\"js-voting-container grid fd-column ai-stretch gs4 fc-black-200\" data-post-id=\"42548459\"><button class=\"js-vote-up-btn grid--cell s-btn s-btn__unset c-pointer\" title=\"This answer is useful\" aria-pressed=\"false\" aria-label=\"up vote\" data-selected-classes=\"fc-theme-primary\"></button>\r\n<div class=\"js-vote-count grid--cell fc-black-500 fs-title grid fd-column ai-center\" data-value=\"16\">16</div>\r\n<button class=\"js-vote-down-btn grid--cell s-btn s-btn__unset c-pointer\" title=\"This answer is not useful\" aria-pressed=\"false\" aria-label=\"down vote\" data-selected-classes=\"fc-theme-primary\"></button></div>\r\n</div>\r\n<div class=\"answercell post-layout--right\">\r\n<div class=\"post-text\">\r\n<p>Please use</p>\r\n<pre class=\"lang-php prettyprint prettyprinted\"><code><span class=\"pun\">{!!</span><span class=\"pln\"> $test </span><span class=\"pun\">!!}</span> </code></pre>\r\n<p>Only in case of HTML while if you want to render data, sting etc. use</p>\r\n<pre class=\"lang-php prettyprint prettyprinted\"><code><span class=\"pun\">{{</span><span class=\"pln\"> $test </span><span class=\"pun\">}}</span></code></pre>\r\n<p>This is because when your blade file is compiled</p>\r\n<p><code>{{ $test }}</code>&nbsp;is converted to&nbsp;<code><!--?php echo e($test) ?--></code>&nbsp;while</p>\r\n<p><code>{!! $test !!}</code>&nbsp;is converted to&nbsp;<code><!--?php echo $test ?--></code><img src=\"/photos/shares/download.jpeg\" alt=\"good and bad\" width=\"316\" height=\"316\" /></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, 0, NULL, '2020-01-12 13:39:35', '2020-01-12 14:05:17', 'Test1 Codeclouds', 'ashutosh.choubey@codeclouds.in', 'laravel-5-display-html-with-blade');
INSERT INTO `blogs` (`id`, `title`, `keywords`, `category`, `photo`, `description`, `post`, `file`, `published`, `deleted_at`, `created_at`, `updated_at`, `author`, `author_email`, `slug`) VALUES
(9, 'laravel Middleware', 'View, composers,re callbacks , class methods t,hat are call,d when, view i,s rend,ered.,If you h,ave data that you w,nt to be bound t, a view each ti,e that vie,w is', '1', 'Screenshot from 2019-11-01 19-30-05_1578908012.png', 'Middleware provide a convenient mechanism for filtering HTTP requests entering your application. For example, Laravel includes a middleware that verifies the user of your application is authenticated. If the user is not authenticated, the middleware will redirect the user to the login screen. However, if the user is authenticated, the middleware will allow the request to proceed further into the application.\r\n\r\nAdditional middleware can be written to perform a variety of tasks besides authentication. A CORS middleware might be responsible for adding the proper headers to all responses leaving your application. A logging middleware might log all incoming requests to your application.', '<h2><a href=\"//laravel.com/docs/5.7/middleware#introduction\">Introduction</a></h2>\r\n<p>Middleware provide a convenient mechanism for filtering HTTP requests entering your application. For example, Laravel includes a middleware that verifies the user of your application is authenticated. If the user is not authenticated, the middleware will redirect the user to the login screen. However, if the user is authenticated, the middleware will allow the request to proceed further into the application.</p>\r\n<p>Additional middleware can be written to perform a variety of tasks besides authentication. A CORS middleware might be responsible for adding the proper headers to all responses leaving your application. A logging middleware might log all incoming requests to your application.</p>\r\n<p>There are several middleware included in the Laravel framework, including middleware for authentication and CSRF protection. All of these middleware are located in the&nbsp;<code class=\" language-php\">app<span class=\"token operator\">/</span>Http<span class=\"token operator\">/</span>Middleware</code>&nbsp;directory.</p>\r\n<p><a name=\"defining-middleware\"></a></p>\r\n<h2><a href=\"//laravel.com/docs/5.7/middleware#defining-middleware\">Defining Middleware</a></h2>\r\n<p>To create a new middleware, use the&nbsp;<code class=\" language-php\">make<span class=\"token punctuation\">:</span>middleware</code>&nbsp;Artisan command:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\">php artisan make<span class=\"token punctuation\">:</span>middleware CheckAge</code></pre>\r\n<p>This command will place a new&nbsp;<code class=\" language-php\">CheckAge</code>&nbsp;class within your&nbsp;<code class=\" language-php\">app<span class=\"token operator\">/</span>Http<span class=\"token operator\">/</span>Middleware</code>&nbsp;directory. In this middleware, we will only allow access to the route if the supplied&nbsp;<code class=\" language-php\">age</code>&nbsp;is greater than 200. Otherwise, we will redirect the users back to the&nbsp;<code class=\" language-php\">home</code>&nbsp;URI:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\"><span class=\"token php language-php\"><span class=\"token delimiter important\">&lt;?php</span>\r\n\r\n<span class=\"token keyword\">namespace</span> <span class=\"token package\">App<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware</span><span class=\"token punctuation\">;</span>\r\n\r\n<span class=\"token keyword\">use</span> <span class=\"token package\">Closure</span><span class=\"token punctuation\">;</span>\r\n\r\n<span class=\"token keyword\">class</span> <span class=\"token class-name\">CheckAge</span>\r\n<span class=\"token punctuation\">{</span>\r\n    <span class=\"token comment\">/**\r\n     * Handle an incoming request.\r\n     *\r\n     * @param  \\Illuminate\\Http\\Request  $request\r\n     * @param  \\Closure  $next\r\n     * @return mixed\r\n     */</span>\r\n    <span class=\"token keyword\">public</span> <span class=\"token keyword\">function</span> <span class=\"token function\">handle</span><span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token punctuation\">,</span> Closure <span class=\"token variable\">$next</span><span class=\"token punctuation\">)</span>\r\n    <span class=\"token punctuation\">{</span>\r\n        <span class=\"token keyword\">if</span> <span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token operator\">-</span><span class=\"token operator\">&gt;</span><span class=\"token property\">age</span> <span class=\"token operator\">&lt;=</span> <span class=\"token number\">200</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span>\r\n            <span class=\"token keyword\">return</span> <span class=\"token function\">redirect</span><span class=\"token punctuation\">(</span><span class=\"token single-quoted-string string\">\'home\'</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span>\r\n        <span class=\"token punctuation\">}</span>\r\n\r\n        <span class=\"token keyword\">return</span> <span class=\"token variable\">$next</span><span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span>\r\n    <span class=\"token punctuation\">}</span>\r\n<span class=\"token punctuation\">}</span></span></code></pre>\r\n<p>As you can see, if the given&nbsp;<code class=\" language-php\">age</code>&nbsp;is less than or equal to&nbsp;<code class=\" language-php\"><span class=\"token number\">200</span></code>, the middleware will return an HTTP redirect to the client; otherwise, the request will be passed further into the application. To pass the request deeper into the application (allowing the middleware to \"pass\"), call the&nbsp;<code class=\" language-php\"><span class=\"token variable\">$next</span></code>&nbsp;callback with the&nbsp;<code class=\" language-php\"><span class=\"token variable\">$request</span></code>.</p>\r\n<p>It\'s best to envision middleware as a series of \"layers\" HTTP requests must pass through before they hit your application. Each layer can examine the request and even reject it entirely.</p>\r\n<blockquote>\r\n<div class=\"callout\">\r\n<div class=\"icon purple\"><img src=\"//laravel.com/img/callouts/lightbulb.min.svg\" /></div>\r\n<p class=\"content\">All middleware are resolved via the&nbsp;<a href=\"//laravel.com/docs/5.7/container\">service container</a>, so you may type-hint any dependencies you need within a middleware\'s constructor.</p>\r\n</div>\r\n</blockquote>\r\n<h3>Before &amp; After Middleware</h3>\r\n<p>Whether a middleware runs before or after a request depends on the middleware itself. For example, the following middleware would perform some task&nbsp;<strong>before</strong>&nbsp;the request is handled by the application:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\"><span class=\"token php language-php\"><span class=\"token delimiter important\">&lt;?php</span>\r\n\r\n<span class=\"token keyword\">namespace</span> <span class=\"token package\">App<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware</span><span class=\"token punctuation\">;</span>\r\n\r\n<span class=\"token keyword\">use</span> <span class=\"token package\">Closure</span><span class=\"token punctuation\">;</span>\r\n\r\n<span class=\"token keyword\">class</span> <span class=\"token class-name\">BeforeMiddleware</span>\r\n<span class=\"token punctuation\">{</span>\r\n    <span class=\"token keyword\">public</span> <span class=\"token keyword\">function</span> <span class=\"token function\">handle</span><span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token punctuation\">,</span> Closure <span class=\"token variable\">$next</span><span class=\"token punctuation\">)</span>\r\n    <span class=\"token punctuation\">{</span>\r\n        <span class=\"token comment\">// Perform action</span>\r\n\r\n        <span class=\"token keyword\">return</span> <span class=\"token variable\">$next</span><span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span>\r\n    <span class=\"token punctuation\">}</span>\r\n<span class=\"token punctuation\">}</span></span></code></pre>\r\n<p>However, this middleware would perform its task&nbsp;<strong>after</strong>&nbsp;the request is handled by the application:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\"><span class=\"token php language-php\"><span class=\"token delimiter important\">&lt;?php</span>\r\n\r\n<span class=\"token keyword\">namespace</span> <span class=\"token package\">App<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware</span><span class=\"token punctuation\">;</span>\r\n\r\n<span class=\"token keyword\">use</span> <span class=\"token package\">Closure</span><span class=\"token punctuation\">;</span>\r\n\r\n<span class=\"token keyword\">class</span> <span class=\"token class-name\">AfterMiddleware</span>\r\n<span class=\"token punctuation\">{</span>\r\n    <span class=\"token keyword\">public</span> <span class=\"token keyword\">function</span> <span class=\"token function\">handle</span><span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token punctuation\">,</span> Closure <span class=\"token variable\">$next</span><span class=\"token punctuation\">)</span>\r\n    <span class=\"token punctuation\">{</span>\r\n        <span class=\"token variable\">$response</span> <span class=\"token operator\">=</span> <span class=\"token variable\">$next</span><span class=\"token punctuation\">(</span><span class=\"token variable\">$request</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span>\r\n\r\n        <span class=\"token comment\">// Perform action</span>\r\n\r\n        <span class=\"token keyword\">return</span> <span class=\"token variable\">$response</span><span class=\"token punctuation\">;</span>\r\n    <span class=\"token punctuation\">}</span>\r\n<span class=\"token punctuation\">}</span></span></code></pre>\r\n<p><a name=\"registering-middleware\"></a></p>\r\n<h2><a href=\"//laravel.com/docs/5.7/middleware#registering-middleware\">Registering Middleware</a></h2>\r\n<p><a name=\"global-middleware\"></a></p>\r\n<h3><a href=\"//laravel.com/docs/5.7/middleware#global-middleware\">Global Middleware</a></h3>\r\n<p>If you want a middleware to run during every HTTP request to your application, list the middleware class in the&nbsp;<code class=\" language-php\"><span class=\"token variable\">$middleware</span></code>&nbsp;property of your&nbsp;<code class=\" language-php\">app<span class=\"token operator\">/</span>Http<span class=\"token operator\">/</span>Kernel<span class=\"token punctuation\">.</span>php</code>&nbsp;class.</p>\r\n<p><a name=\"assigning-middleware-to-routes\"></a></p>\r\n<h3><a href=\"//laravel.com/docs/5.7/middleware#assigning-middleware-to-routes\">Assigning Middleware To Routes</a></h3>\r\n<p>If you would like to assign middleware to specific routes, you should first assign the middleware a key in your&nbsp;<code class=\" language-php\">app<span class=\"token operator\">/</span>Http<span class=\"token operator\">/</span>Kernel<span class=\"token punctuation\">.</span>php</code>&nbsp;file. By default, the&nbsp;<code class=\" language-php\"><span class=\"token variable\">$routeMiddleware</span></code>&nbsp;property of this class contains entries for the middleware included with Laravel. To add your own, append it to this list and assign it a key of your choosing:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\"><span class=\"token comment\">// Within App\\Http\\Kernel Class...</span>\r\n\r\n<span class=\"token keyword\">protected</span> <span class=\"token variable\">$routeMiddleware</span> <span class=\"token operator\">=</span> <span class=\"token punctuation\">[</span>\r\n    <span class=\"token single-quoted-string string\">\'auth\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">App<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>Authenticate</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'auth.basic\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Auth<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>AuthenticateWithBasicAuth</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'bindings\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Routing<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>SubstituteBindings</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'cache.headers\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>SetCacheHeaders</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'can\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Auth<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>Authorize</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'guest\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">App<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>RedirectIfAuthenticated</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'signed\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Routing<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>ValidateSignature</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'throttle\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Routing<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>ThrottleRequests</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n    <span class=\"token single-quoted-string string\">\'verified\'</span> <span class=\"token operator\">=</span><span class=\"token operator\">&gt;</span> \\<span class=\"token package\">Illuminate<span class=\"token punctuation\">\\</span>Auth<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>EnsureEmailIsVerified</span><span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">,</span>\r\n<span class=\"token punctuation\">]</span><span class=\"token punctuation\">;</span></code></pre>\r\n<p>Once the middleware has been defined in the HTTP kernel, you may use the&nbsp;<code class=\" language-php\">middleware</code>&nbsp;method to assign middleware to a route:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\">Route<span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token function\">get</span><span class=\"token punctuation\">(</span><span class=\"token single-quoted-string string\">\'admin/profile\'</span><span class=\"token punctuation\">,</span> <span class=\"token keyword\">function</span> <span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span>\r\n    <span class=\"token comment\">//</span>\r\n<span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token operator\">-</span><span class=\"token operator\">&gt;</span><span class=\"token function\">middleware</span><span class=\"token punctuation\">(</span><span class=\"token single-quoted-string string\">\'auth\'</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span></code></pre>\r\n<p>You may also assign multiple middleware to the route:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\">Route<span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token function\">get</span><span class=\"token punctuation\">(</span><span class=\"token single-quoted-string string\">\'/\'</span><span class=\"token punctuation\">,</span> <span class=\"token keyword\">function</span> <span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span>\r\n    <span class=\"token comment\">//</span>\r\n<span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token operator\">-</span><span class=\"token operator\">&gt;</span><span class=\"token function\">middleware</span><span class=\"token punctuation\">(</span><span class=\"token single-quoted-string string\">\'first\'</span><span class=\"token punctuation\">,</span> <span class=\"token single-quoted-string string\">\'second\'</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span></code></pre>\r\n<p>When assigning middleware, you may also pass the fully qualified class name:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\"><span class=\"token keyword\">use</span> <span class=\"token package\">App<span class=\"token punctuation\">\\</span>Http<span class=\"token punctuation\">\\</span>Middleware<span class=\"token punctuation\">\\</span>CheckAge</span><span class=\"token punctuation\">;</span>\r\n\r\nRoute<span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token function\">get</span><span class=\"token punctuation\">(</span><span class=\"token single-quoted-string string\">\'admin/profile\'</span><span class=\"token punctuation\">,</span> <span class=\"token keyword\">function</span> <span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span>\r\n    <span class=\"token comment\">//</span>\r\n<span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token operator\">-</span><span class=\"token operator\">&gt;</span><span class=\"token function\">middleware</span><span class=\"token punctuation\">(</span>CheckAge<span class=\"token punctuation\">:</span><span class=\"token punctuation\">:</span><span class=\"token keyword\">class</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span></code></pre>\r\n<p><a name=\"middleware-groups\"></a></p>\r\n<h3><a href=\"//laravel.com/docs/5.7/middleware#middleware-groups\">Middleware Groups</a></h3>\r\n<p>Sometimes you may want to group several middleware under a single key to make them easier to assign to routes. You may do this using the&nbsp;<code class=\" language-php\"><span class=\"token variable\">$middlewareGroups</span></code>&nbsp;property of your HTTP kernel.</p>\r\n<p>Out of the box, Laravel comes with&nbsp;<code class=\" language-php\">web</code>&nbsp;and&nbsp;<code class=\" language-php\">api</code>&nbsp;middleware groups that contain common middleware you may want to apply to your web UI and API routes:<img src=\"//localhost:8000/photos/2/image_2019_11_28T11_17_31_130Z.png\" alt=\"some error\" /></p>\r\n<p>this is the blog management tutorials</p>', 'Screenshot from 2019-10-14 16-47-36_1578908012.png', 1, NULL, '2020-01-13 04:02:18', '2020-01-14 03:01:01', 'Test1 Codeclouds', 'admin@admin.com', 'middleware');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoryname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorydescription` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryname`, `categorydescription`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Laravel 6', 'The PHP Framework for Web Artisans\r\nLaravel is a web application framework with expressive, elegant syntax. We’ve already laid the foundation — freeing you to create without sweating the small things.', NULL, '2020-01-09 08:33:56', '2020-01-09 08:36:18'),
(2, 'angular 9', 'angular 9 tu13434343', NULL, '2020-01-09 08:36:59', '2020-01-12 05:06:14'),
(3, 'laravel 5', 'laravel 5....', '2020-01-10 08:40:16', '2020-01-10 08:39:51', '2020-01-10 08:40:16'),
(4, 'test', 'test descripition', NULL, '2020-01-12 04:17:39', '2020-01-12 04:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_30_102339_role', 2),
(5, '2019_12_30_102410_role_user', 2),
(7, '2020_01_06_071953_create_blogs_table', 3),
(8, '2020_01_09_085541_add_user_role_column', 4),
(9, '2020_01_09_090012_add_user_type_column', 5),
(10, '2020_01_09_091018_create_categories_table', 6),
(11, '2020_01_12_071316_user_type', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super User', 'this user can do everything', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(7, 1, 2, NULL, NULL, NULL),
(8, 2, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) NOT NULL DEFAULT '2',
  `user_type` bigint(20) NOT NULL DEFAULT '2',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `user_type`, `deleted_at`) VALUES
(1, 'Test1 Codeclouds', 'ashutosh.choubey@codeclouds.in', NULL, '$2y$10$oaAYe1IgsrKe0zPTYju.Ku955Rc.vZ.HlrvXtvnOle.GmULJZ0wyC', NULL, '2019-12-30 04:32:13', '2019-12-30 04:32:13', 1, 1, NULL),
(2, 'Test1 Codeclouds', 'admin@admin.com', NULL, '$2y$10$3zzKyFwrP.foQsYqh2iW4.DBiFd5V4QNJgqk58CpkqwpglEx./TNG', NULL, '2020-01-06 01:58:18', '2020-01-06 01:58:18', 0, 1, NULL),
(3, 'Test1 Codeclouds', 'admin1@admin.com', NULL, '$2y$10$aVy2JjrocGu2AG8JBiRtjuiHzBEdh.hNV4gqAaUc6CXMGeIcHqDk2', NULL, '2020-01-12 02:35:39', '2020-01-12 02:35:39', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super User', 'Can Do all the thing', NULL, '2020-01-12 02:12:02', '2020-01-12 02:14:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
