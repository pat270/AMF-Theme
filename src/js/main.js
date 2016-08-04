AUI().ready(
	'aui-base',
	'liferay-sign-in-modal',
	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function(A) {
		var signIn = A.one('.sign-in');

		if (signIn) {
			signIn.plug(Liferay.SignInModal);
		}
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
	}
);

/*
Extends Liferay's built-in liferay-navigation-interaction module.
*/
AUI.add(
	'liferay-navigation-interaction-advisorcompass',
	function(A) {
		var NAME = 'liferaynavigationinteractionadvisorcompass';

		var NavigationInteractionAdvisorcompass = A.Component.create(
			{
				EXTENDS: Liferay.NavigationInteraction,

				NAME: NAME,

				NS: NAME,

				prototype: {
					initializer: function(config) {
						console.log('initializer()');
						var instance = this;

						instance._navigationToggleTriggers = A.all('.navigation-toggle-trigger');
						instance._navigationToggleTargets = A.all('.navigation-toggle-target');
						instance._navigationBack = A.one('#navigationBack');

						instance._navigationToggleTriggers.on(
							'click',
							function (event) {
								console.log('instance._navigationToggleTriggers.on(click)');

								var isOpen = instance._navigationToggleTargets.first().hasClass('open')

								instance._navigationToggleTriggers.attr('aria-expanded', !isOpen);

								instance._navigationToggleTargets.toggleClass('open', !isOpen);

								// if (isOpen) {
								// 	var navigation = A.one('#navigation');

								// 	navigation.all('.child-open').removeClass('child-open');
								// 	navigation.all('.open').removeClass('open');
								// }
							}
						);

						instance._navigationBack.on(
							'click',
							function (event) {
								console.log('instance._navigationBack.on(click)');

								var menu = A.one('#' + event.currentTarget.attr('data-menu'));

								if (menu) {
									Liferay.fire('hideNavigationMenu', {menu: menu}, instance);
								}
							}
						);

						Liferay.detach(['hideNavigationMenu', 'showNavigationMenu']);

						Liferay.on(
							['hideNavigationMenu', 'showNavigationMenu'],
							instance._onNavigationMenuToggle
						);
					},

					_initChildMenuHandlers: function(navigation) {
						console.log('_initChildMenuHandlers()');
						var instance = this;

						if (navigation) {
							navigation.delegate(['click'], instance._onMouseToggle, '> li .menuitem-title', instance);

							// navigation.delegate('keydown', instance._handleKeyDown, 'a', instance); // Off for now. TODO FocusManager
						}
					},

					_initNodeFocusManager: function() {
						// Off for now. TODO FocusManager
					},

					_onNavigationMenuToggle: function(event, instance) {
						var menuLI = event.menu;
						var parentUL = menuLI.ancestor('ul');

						var hasChildMenu = menuLI.one('> ul');

						var parentId;

						var showMenu = (event.type == 'showNavigationMenu') && hasChildMenu;

						if (showMenu) {
							parentUL.all('li').removeClass('open');
							parentUL.all('li ul').removeClass('child-open');

							menuLI.addClass('open');
							parentUL.addClass('child-open');

							parentId = menuLI.get('id');
						}
						else {
							var isChildOpen = parentUL.contains(parentUL.one('> li.open'));

							if (!isChildOpen) {
								parentUL.removeClass('child-open');
							}

							menuLI.all('ul').removeClass('child-open');
							menuLI.all('ul li').removeClass('open');

							menuLI.removeClass('open');

							if (instance) {

								var parentLI = parentUL.ancestor('li');

								parentId = parentLI ? parentLI.get('id') : '';
							}
						}

						var navigationBack = instance && instance._navigationBack;

						if (navigationBack && !parentUL.hasClass('lvl3')) {
							navigationBack.toggleClass('open', !!parentId);

							navigationBack.attr(
								'data-menu',
								parentId
							);
						}
					},

					_onMouseToggle: function(event) {
						var instance = this;

						// var mapHover = instance.MAP_HOVER; // Off for now. TODO FocusManager
						var mapHover = {};

						var eventType = 'showNavigationMenu';

						mapHover.menu = event.currentTarget.ancestor('li');

						if (mapHover.menu.hasClass('open')) {
							eventType = 'hideNavigationMenu';

							// instance.MAP_HOVER = {}; // Off for now. TODO FocusManager
						}

						Liferay.fire(eventType, mapHover, instance);
					}
				}
			}
		);

		Liferay.NavigationInteractionAdvisorcompass = NavigationInteractionAdvisorcompass;
	},
	'',
	{
		requires: ['liferay-navigation-interaction']
	}
);