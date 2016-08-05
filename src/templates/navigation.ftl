<div id="navigationOverlay" class="navigation-toggle-trigger navigation-toggle-target" aria-expanded="false" aria-controls="navigation"></div>

<div id="navigationWrapper" class="navigation-toggle-target">
	<div class="container">
		<div class="row" id="navigationHeaderControls">
			<div class="pull-left">
				<button aria-controls="navigation" class="ac-header-btn btn" id="navigationBack" type="button">
					<span class="ac-header-btn-icon icon-caret-left icon-2x"></span>

					<div class="ac-header-btn-label">Back</div>
				</button>
			</div>

			<div class="pull-right">
				<button aria-controls="navigation" aria-expanded="false" class="ac-header-btn btn navigation-toggle-trigger" type="button">
					<svg class="ac-header-btn-icon lexicon-icon lexicon-icon-times" viewBox="0 0 512 512">
						<path class="lexicon-icon-outline" d="M295.781 256l205.205-205.205c10.998-10.998 10.998-28.814 0-39.781-10.998-10.998-28.815-10.998-39.781 0l-205.205 205.205-205.205-205.238c-10.966-10.998-28.814-10.998-39.781 0-10.998 10.998-10.998 28.814 0 39.781l205.205 205.238-205.205 205.205c-10.998 10.998-10.998 28.815 0 39.781 5.467 5.531 12.671 8.265 19.874 8.265s14.407-2.734 19.907-8.233l205.205-205.238 205.205 205.205c5.5 5.5 12.703 8.233 19.906 8.233s14.407-2.734 19.906-8.233c10.998-10.998 10.998-28.815 0-39.781l-205.238-205.205z"></path>
					</svg>

					<div class="ac-header-btn-label">Menu</div>
				</button>
			</div>
		</div>

		<div class="row">
			<nav id="navigation" role="navigation">
				<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

				<div class="tagline"><@liferay.language key="welcome" /></div>

				<#-- LVL1 NAV -->
				<div class="menu-wrapper lvl1">
					<ul aria-label="<@liferay.language key="site-pages" />" role="menubar">
						<#list nav_items as nav_item_lvl1>
							<#assign nav_item_lvl1_attr_has_popup = "" />
							<#assign nav_item_lvl1_attr_selected = "" />
							<#assign nav_item_lvl1_class_selected = "" />
							<#assign nav_item_lvl1_layout = nav_item_lvl1.getLayout() />

							<#if nav_item_lvl1.isSelected()>
								<#assign nav_item_lvl1_attr_has_popup = "aria-haspopup='true'" />
								<#assign nav_item_lvl1_attr_selected = "aria-selected='true'" />
								<#assign nav_item_lvl1_class_selected = "selected" />
							</#if>

							<li ${nav_item_lvl1_attr_selected} class="${nav_item_lvl1_class_selected}" id="layout_${nav_item_lvl1.getLayoutId()}" role="presentation">
								<#if !nav_item_lvl1.hasChildren()>
									<a class="menuitem-title" aria-labelledby="layout_${nav_item_lvl1.getLayoutId()}" ${nav_item_lvl1_attr_has_popup} href="${nav_item_lvl1.getURL()}" ${nav_item_lvl1.getTarget()} role="menuitem">
										<@liferay_theme["layout-icon"] layout=nav_item_lvl1_layout /> ${nav_item_lvl1.getName()}
									</a>
								<#else>
									<a class="menuitem-title has-children" href="#" aria-labelledby="layout_${nav_item_lvl1.getLayoutId()}" ${nav_item_lvl1_attr_has_popup} ${nav_item_lvl1.getTarget()} role="menuitem">
										<@liferay_theme["layout-icon"] layout=nav_item_lvl1_layout /> ${nav_item_lvl1.getName()}

										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>

									<#-- LVL2 NAV -->
									<div class="menu-wrapper child-menu lvl2">
										<ul role="menu">
											<#list nav_item_lvl1.getChildren() as nav_child_lvl2>
												<#assign nav_child_lvl2_attr_has_popup = "" />
												<#assign nav_child_lvl2_attr_selected = "" />
												<#assign nav_child_lvl2_class_selected = "" />

												<#if nav_item_lvl1.isSelected()>
													<#assign nav_child_lvl2_attr_has_popup = "aria-haspopup='true'" />
													<#assign nav_child_lvl2_attr_selected = "aria-selected='true'" />
													<#assign nav_child_lvl2_class_selected = "selected" />
												</#if>

												<li ${nav_child_lvl2_attr_selected} class="${nav_child_lvl2_class_selected}" id="layout_${nav_child_lvl2.getLayoutId()}" role="presentation">
													<#if !nav_child_lvl2.hasChildren()>
														<a class="menuitem-title" aria-labelledby="layout_${nav_child_lvl2.getLayoutId()}" href="${nav_child_lvl2.getURL()}" ${nav_child_lvl2.getTarget()} role="menuitem">
															${nav_child_lvl2.getName()}
														</a>
													<#else>
														<a class="menuitem-title has-children" href="#" aria-labelledby="layout_${nav_child_lvl2.getLayoutId()}" ${nav_child_lvl2_attr_has_popup} role="menuitem">
															${nav_child_lvl2.getName()}

															<span class="glyphicon glyphicon-chevron-right"></span>
														</a>

														<#-- LVL3 NAV -->
														<div class="menu-wrapper child-menu lvl3">
															<ul role="menu">
																<#list nav_child_lvl2.getChildren() as nav_child_lvl3>
																	<#assign nav_child_lvl3_attr_has_popup = "" />
																	<#assign nav_child_lvl3_attr_selected = "" />
																	<#assign nav_child_lvl3_class_selected = "" />

																	<#if nav_child_lvl2.isSelected()>
																		<#assign nav_child_lvl3_attr_has_popup = "aria-haspopup='true'" />
																		<#assign nav_child_lvl3_attr_selected = "aria-selected='true'" />
																		<#assign nav_child_lvl3_class_selected = "selected" />
																	</#if>

																	<li ${nav_child_lvl3_attr_selected} class="${nav_child_lvl3_class_selected}" id="layout_${nav_child_lvl3.getLayoutId()}" role="presentation">
																		<#if !nav_child_lvl3.hasChildren()>
																			<a class="menuitem-title" aria-labelledby="layout_${nav_child_lvl3.getLayoutId()}" href="${nav_child_lvl3.getURL()}" ${nav_child_lvl3.getTarget()} role="menuitem">
																				${nav_child_lvl3.getName()}
																			</a>
																		<#else>
																			<a class="menuitem-title has-children" href="#" aria-labelledby="layout_${nav_child_lvl3.getLayoutId()}" ${nav_child_lvl3_attr_has_popup} role="menuitem">
																				${nav_child_lvl3.getName()}

																				<span class="glyphicon glyphicon glyphicon-plus"></span>
																			</a>

																			<#-- LVL4 NAV -->
																			<div class="menu-wrapper child-menu lvl4">
																				<ul role="menu">
																					<#list nav_child_lvl3.getChildren() as nav_child_lvl4>
																						<#assign nav_child_lvl4_attr_has_popup = "" />
																						<#assign nav_child_lvl4_attr_selected = "" />
																						<#assign nav_child_lvl4_class_selected = "" />

																						<#if nav_child_lvl3.isSelected()>
																							<#assign nav_child_lvl4_attr_has_popup = "aria-haspopup='true'" />
																							<#assign nav_child_lvl4_attr_selected = "aria-selected='true'" />
																							<#assign nav_child_lvl4_class_selected = "selected" />
																						</#if>

																						<li ${nav_child_lvl4_attr_selected} class="${nav_child_lvl4_class_selected}" id="layout_${nav_child_lvl4.getLayoutId()}" role="presentation">
																							<a class="menuitem-title" aria-labelledby="layout_${nav_child_lvl4.getLayoutId()}" href="${nav_child_lvl4.getURL()}" ${nav_child_lvl4.getTarget()} role="menuitem">
																								${nav_child_lvl4.getName()}
																							</a>
																						</li>
																					</#list>
																				</ul>
																			</div>
																			<#-- lvl4 NAV -->
																		</#if>
																	</li>
																</#list>
															</ul>
														</div>
														<#-- lvl3 NAV -->
													</#if>
												</li>
											</#list>
										</ul>
									</div>
									<#-- lvl2 NAV -->
								</#if>
							</li>
						</#list>

						<li role="presentation" class="nav-footer" id="layoutNavContacts">
							<a class="menuitem-title" aria-labelledby="layoutNavContacts" href="#" role="menuitem">
								<span class="glyphicon glyphicon-user"></span>

								${languageUtil.get(locale, "contacts")}
							</a>
						</li>

						<li role="presentation" class="nav-footer" id="layoutNavEmail">
							<a class="menuitem-title" aria-labelledby="layoutNavEmail" href="#" role="menuitem">
								<span class="glyphicon glyphicon-envelope"></span>

								${languageUtil.get(locale, "email")}
							</a>
						</li>

						<#-- OBO NAV -->
						<li role="presentation" class="nav-footer" id="layoutNavActiveProfile">
							<h2>${languageUtil.get(locale, "active-profile")}:</h2>

							<a class="menuitem-title has-children" href="#" aria-labelledby="layoutNavActiveProfile" role="menuitem">
								<#-- TODO ${obo_active.getName()} -->
								${"Firstname Lastname"}

								<span class="glyphicon glyphicon-chevron-right"></span>
							</a>

							<div class="menu-wrapper child-menu lvl2 active-profile">
								<h2>${languageUtil.get(locale, "active-profile")}:</h2>

								<ul role="menu">
									<li id="<#-- layout_${obo_active.getId()} -->" role="presentation">
										<label class="menuitem-title" aria-labelledby="<#-- layout_${obo_active.getId()} -->" role="menuitem">
											<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_active.getId()} -->" />

											<#-- TODO ${obo_active.getName()} -->
											${"Firstname Lastname"}

											(${languageUtil.get(locale, "you")})
										</label>
									</li>

									<#-- TODO <#list obo.getChildren() as obo_child> -->
										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>

										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>

										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>

										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>

										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>

										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>

										<li id="<#-- TODO layout_${obo_child.getId()} -->" role="presentation">
											<label class="menuitem-title" aria-labelledby="<#-- TODO layout_${obo_child.getId()} -->" role="menuitem">
												<input type="radio" name='${"obo-field-name"}' value="<#-- TODO ${obo_child.getId()} -->" />

												(${languageUtil.get(locale, "on-behalf-of")})

												<#-- TODO ${obo_child.getName()} -->
												${"Firstname Lastname"}
											</label>
										</li>
									<#-- </#list> -->
								</ul>
							</div>
						</li>
						<#-- obo nav -->

						<#-- <#if is_signed_in> -->
							<li role="presentation" class="nav-footer" id="navLogout">
								<span class="menuitem-title has-children" href="#" aria-labelledby="navLogout" role="menuitem">
									<@liferay_aui["button"] cssClass="btn-block" onClick="TODO" value="logout" />
								</span>
							</li>
						<#-- </#if> -->
					</ul>
				</div>
				<#-- lvl1 nav -->
			</nav>
		</div>
	</div>
</div>

<@liferay_aui.script use="liferay-navigation-interaction-advisorcompass">
	var navigation = A.one('#navigation');

	if (navigation) {
		navigation.plug(Liferay.NavigationInteractionAdvisorcompass);
	}
</@>