<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="advisor-compass-override ${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div id="wrapper">
	<#-- HEADER/BANNER -->
	<header class="ac-header" id="banner" role="banner">
		<div class="container">
			<div class="ac-header-left">
				<a class="${logo_css_class} site-logo text-hide" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">${site_name}</a>
			</div>

			<div class="ac-header-right">
				<#-- SEARCH -->
				<div aria-expanded="false" class="collapse" id="acHeaderSearchBar">
					<div role="search">
						<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone")>

						<@liferay.search default_preferences="${freeMarkerPortletPreferences}" />

						<#assign VOID = freeMarkerPortletPreferences.reset()>
					</div>
				</div>
				<#-- search -->

				<#-- SEARCH -->
				<button aria-controls="search" aria-expanded="false" class="ac-header-search-toggle ac-header-btn btn collapsed visible-xs-block" data-target="#acHeaderSearchBar" data-toggle="collapse" type="button">
					<svg class="lexicon-icon lexicon-icon-search search-toggle-closed-icon" role="img" title="" viewBox="0 0 512 512">  
						<path class="lexicon-icon-outline" d="M503.254 467.861l-133.645-133.645c27.671-35.13 44.344-79.327 44.344-127.415 0-113.784-92.578-206.362-206.362-206.362s-206.362 92.578-206.362 206.362 92.578 206.362 206.362 206.362c47.268 0 90.735-16.146 125.572-42.969l133.851 133.851c5.002 5.002 11.554 7.488 18.106 7.488s13.104-2.486 18.106-7.488c10.004-10.003 10.004-26.209 0.029-36.183zM52.446 206.801c0-85.558 69.616-155.173 155.173-155.173s155.174 69.616 155.174 155.173-69.616 155.173-155.173 155.173-155.173-69.616-155.173-155.173z"></path>
					</svg>

					<svg class="lexicon-icon lexicon-icon-times search-toggle-open-icon" viewBox="0 0 512 512">
						<path class="lexicon-icon-outline" d="M295.781 256l205.205-205.205c10.998-10.998 10.998-28.814 0-39.781-10.998-10.998-28.815-10.998-39.781 0l-205.205 205.205-205.205-205.238c-10.966-10.998-28.814-10.998-39.781 0-10.998 10.998-10.998 28.814 0 39.781l205.205 205.238-205.205 205.205c-10.998 10.998-10.998 28.815 0 39.781 5.467 5.531 12.671 8.265 19.874 8.265s14.407-2.734 19.907-8.233l205.205-205.238 205.205 205.205c5.5 5.5 12.703 8.233 19.906 8.233s14.407-2.734 19.906-8.233c10.998-10.998 10.998-28.815 0-39.781l-205.238-205.205z"></path>
					</svg>

					<div class="ac-header-btn-label">Search</div>
				</button>
				<#-- search -->

				<#-- NAVIGATION -->
				<button aria-controls="navigation" aria-expanded="false" class="ac-header-btn btn hidden-lg navigation-toggle-trigger" data-target=".navigationCollapse" data-toggle="collapse" type="button">
					<svg class="lexicon-icon lexicon-icon-bars" viewBox="0 0 512 512">
						<path class="lexicon-icon-outline" d="M480 64h-448c-17.664 0-32-14.336-32-32v0c0-17.664 14.336-32 32-32h448c17.664 0 32 14.336 32 32v0c0 17.664-14.336 32-32 32z"></path>
						<path class="lexicon-icon-outline" d="M480 288h-448c-17.664 0-32-14.336-32-32v0c0-17.664 14.336-32 32-32h448c17.664 0 32 14.336 32 32v0c0 17.664-14.336 32-32 32z"></path>
						<path class="lexicon-icon-outline" d="M480 512h-448c-17.664 0-32-14.336-32-32v0c0-17.664 14.336-32 32-32h448c17.664 0 32 14.336 32 32v0c0 17.664-14.336 32-32 32z"></path>
					</svg>
					<div class="ac-header-btn-label">Menu</div>
				</button>
				<#-- navigation -->

				<div class="ac-header-site-links visible-lg-block">
					<a aria-labelledby="email" class="ac-header-site-link-item" href="#" role="menuitem">
						<span class="icon-envelope-alt"></span>

						<@liferay.language key="email" />
					</a>

					<a aria-labelledby="contact" class="ac-header-site-link-item" href="#" role="menuitem">
						<span class="icon-user"></span>

						<@liferay.language key="contact" />
					</a>

					<#if is_signed_in>
						<span class="ac-header-site-link-item truncate-text user-greeting">
							<@liferay.language key="welcome" />, ${user_name}
						</span>

						<a class="ac-header-site-link-item" href="${sign_out_url}">
							<@liferay.language key="logout" />
						</a>
					<#else>
						<a class="ac-header-site-link-item sign-in" href="${sign_in_url}">
							<@liferay.language key="login" />
						</a>
					</#if>
				</div>
			</div>
		</div>
	</header>
	<#-- header/banner -->

	<#-- NAVIGATION -->
	<#if has_navigation && is_setup_complete>
		<#include "${full_templates_path}/navigation.ftl" />
	</#if>
	<#-- navigation -->

	<#-- CONTENT -->
	<section id="content" class="container">
		<h1 class="hide-accessible">${the_title}</h1>

		<#-- TODO REMOVE -->
		<#-- <nav id="breadcrumbs">
			<@liferay.breadcrumbs />
		</nav> -->

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>
	<#-- content -->

	<#-- FOOTER -->
	<footer id="footer" role="contentinfo" class="container" class="row">
		<div class="row">
			<p class="powered-by">
				<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
			</p>
		</div>
	</footer>
	<#-- footer -->
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>