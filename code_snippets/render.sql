procedure render_plugin (
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
) as
    l_item_name        varchar2(4000) := apex_plugin.get_input_name_for_page_item(false);
    l_html             clob := '';
    l_parent_region_id number := p_item.region_id;
    l_region_static_id apex_application_page_regions.static_id%type;
    l_region_type_name varchar2(100);
    attr_js_action   clob := p_item.attributes.get_varchar2('js_action');
    attr_icon_html   clob := p_item.attributes.get_varchar2('icon_html');
    attr_position    varchar2(100) := p_item.attributes.get_varchar2('position');
begin
    select static_id, source_type
      into l_region_static_id, l_region_type_name
      from apex_application_page_regions
     where application_id = :APP_ID     
       and region_id      = l_parent_region_id;

    if l_region_type_name <> 'Map' then  
        raise_application_error(-20000, 'ERROR: The map control page item "' || l_item_name || '" must be placed within a parent region of type "Map".');
    end if;

    -- Debug HTML (optional)
    -- l_html := l_html || '<div style="margin-bottom: 1em; color: gray;">';
    -- l_html := l_html || '<br>l_item_name : '         || l_item_name;
    -- l_html := l_html || '<br>Parent Region Static ID: ' || l_region_static_id;
    -- l_html := l_html || '<br>Control position: '         || attr_position;
    -- l_html := l_html || '</div>';
    -- htp.p(l_html);

    apex_javascript.add_onload_code(
        'window.mapControl.init(' ||
        apex_escape.js_literal(l_item_name) || ',' ||
        apex_escape.js_literal(l_region_static_id) || ',' ||
        apex_escape.js_literal(attr_position) || ',' ||
        apex_escape.js_literal(attr_icon_html) || ',' ||
        apex_escape.js_literal(attr_js_action) ||
        ');'
    );

    apex_json.free_output;
end render_plugin;