prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.8'
,p_default_workspace_id=>7698810536136159
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_DEV'
);
end;
/
 
prompt APPLICATION 100 - Scratch
--
-- Application Export:
--   Application:     100
--   Name:            Scratch
--   Date and Time:   10:00 Wednesday September 3, 2025
--   Exported By:     DEV
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 40312379189115768
--   Manifest End
--   Version:         24.2.8
--   Instance ID:     7698671066064501
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/test_control8993
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(40312379189115768)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'MAP_CONTROL'
,p_display_name=>'Map Control'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_javascript_file_urls=>'#PLUGIN_FILES#plugin_index#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render_plugin (',
'    p_item   in            apex_plugin.t_item,',
'    p_plugin in            apex_plugin.t_plugin,',
'    p_param  in            apex_plugin.t_item_render_param,',
'    p_result in out nocopy apex_plugin.t_item_render_result',
') as',
'    l_item_name        varchar2(4000) := apex_plugin.get_input_name_for_page_item(false);',
'    l_html             clob := '''';',
'    l_parent_region_id number := p_item.region_id;',
'    l_region_static_id apex_application_page_regions.static_id%type;',
'    l_region_type_name varchar2(100);',
'    attr_js_action   clob := p_item.attributes.get_varchar2(''js_action'');',
'    attr_icon_html   clob := p_item.attributes.get_varchar2(''icon_html'');',
'    attr_position    varchar2(100) := p_item.attributes.get_varchar2(''position'');',
'begin',
'    select static_id, source_type',
'      into l_region_static_id, l_region_type_name',
'      from apex_application_page_regions',
'     where application_id = :APP_ID     ',
'       and region_id      = l_parent_region_id;',
'',
'    if l_region_type_name <> ''Map'' then  ',
'        raise_application_error(-20000, ''ERROR: The map control page item "'' || l_item_name || ''" must be placed within a parent region of type "Map".'');',
'    end if;',
'',
'    -- Debug HTML (optional)',
'    -- l_html := l_html || ''<div style="margin-bottom: 1em; color: gray;">'';',
'    -- l_html := l_html || ''<br>l_item_name : ''         || l_item_name;',
'    -- l_html := l_html || ''<br>Parent Region Static ID: '' || l_region_static_id;',
'    -- l_html := l_html || ''<br>Control position: ''         || attr_position;',
'    -- l_html := l_html || ''</div>'';',
'    -- htp.p(l_html);',
'',
'    apex_javascript.add_onload_code(',
'        ''window.mapControl.init('' ||',
'        apex_escape.js_literal(l_item_name) || '','' ||',
'        apex_escape.js_literal(l_region_static_id) || '','' ||',
'        apex_escape.js_literal(attr_position) || '','' ||',
'        apex_escape.js_literal(attr_icon_html) || '','' ||',
'        apex_escape.js_literal(attr_js_action) ||',
'        '');''',
'    );',
'',
'    apex_json.free_output;',
'end render_plugin;'))
,p_api_version=>3
,p_render_function=>'render_plugin'
,p_standard_attributes=>'SOURCE:ELEMENT'
,p_substitute_attributes=>true
,p_version_scn=>45087860897502
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>239
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(40516599040467991)
,p_plugin_id=>wwv_flow_imp.id(40312379189115768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'js_action'
,p_prompt=>'JS Action'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(40521199882580328)
,p_plugin_id=>wwv_flow_imp.id(40312379189115768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'icon_html'
,p_prompt=>'Icon Html'
,p_attribute_type=>'HTML'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(40521806515582433)
,p_plugin_id=>wwv_flow_imp.id(40312379189115768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'position'
,p_prompt=>'Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(40522994251594284)
,p_plugin_attribute_id=>wwv_flow_imp.id(40521806515582433)
,p_display_sequence=>10
,p_display_value=>'Top Right'
,p_return_value=>'top-right'
,p_help_text=>'top-right'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(40523334992598831)
,p_plugin_attribute_id=>wwv_flow_imp.id(40521806515582433)
,p_display_sequence=>20
,p_display_value=>'Top Left'
,p_return_value=>'top-left'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(40523796028600797)
,p_plugin_attribute_id=>wwv_flow_imp.id(40521806515582433)
,p_display_sequence=>30
,p_display_value=>'Bottom Right'
,p_return_value=>'bottom-right'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(40524139495602241)
,p_plugin_attribute_id=>wwv_flow_imp.id(40521806515582433)
,p_display_sequence=>40
,p_display_value=>'Bottom Left'
,p_return_value=>'bottom-left'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '77696E646F772E6D6170436F6E74726F6C203D2077696E646F772E6D6170436F6E74726F6C207C7C207B7D3B0A77696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E203D207B7D3B200A0A77696E646F772E6D6170436F';
wwv_flow_imp.g_varchar2_table(2) := '6E74726F6C2E696E6974203D2066756E6374696F6E286974656D4E616D652C206D6170526567696F6E49642C20706F736974696F6E2C2069636F6E5F68746D6C2C206A735F616374696F6E29207B0A0A20202020696620282177696E646F772E6D617043';
wwv_flow_imp.g_varchar2_table(3) := '6F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6D6170526567696F6E49645D29207B0A202020202020202077696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6D6170526567696F6E49645D203D205B5D';
wwv_flow_imp.g_varchar2_table(4) := '3B0A202020207D0A0A2020202077696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6D6170526567696F6E49645D2E70757368287B0A20202020202020206974656D4E616D652C0A2020202020202020706F73697469';
wwv_flow_imp.g_varchar2_table(5) := '6F6E2C0A202020202020202069636F6E5F68746D6C2C0A20202020202020206A735F616374696F6E0A202020207D293B0A0A202020207661722024726567696F6E203D202428272327202B206D6170526567696F6E4964293B0A0A202020206966202821';
wwv_flow_imp.g_varchar2_table(6) := '24726567696F6E2E6461746128276D632D696E6974272929207B0A202020202020202024726567696F6E2E6461746128276D632D696E6974272C2074727565293B0A0A202020202020202024726567696F6E2E6F6E28277370617469616C6D6170696E69';
wwv_flow_imp.g_varchar2_table(7) := '7469616C697A65642E4D41505F524547494F4E272C2066756E6374696F6E286576656E7429207B0A202020202020202020202020766172206D6170203D20617065782E726567696F6E286D6170526567696F6E4964292E63616C6C28226765744D61704F';
wwv_flow_imp.g_varchar2_table(8) := '626A65637422293B0A20202020202020202020202069662028216D617029207B0A20202020202020202020202020202020636F6E736F6C652E6572726F7228224D617020636F756C64206E6F74206265207265747269657665642E22293B0A2020202020';
wwv_flow_imp.g_varchar2_table(9) := '202020202020202020202072657475726E3B0A2020202020202020202020207D0A0A2020202020202020202020202877696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6D6170526567696F6E49645D207C7C205B5D';
wwv_flow_imp.g_varchar2_table(10) := '292E666F72456163682866756E6374696F6E286374726C29207B0A20202020202020202020202020202020636F6E737420636F6E74726F6C203D20637265617465436F6E74726F6C286374726C2E6974656D4E616D652C206374726C2E69636F6E5F6874';
wwv_flow_imp.g_varchar2_table(11) := '6D6C2C206374726C2E6A735F616374696F6E293B0A202020202020202020202020202020206D61702E616464436F6E74726F6C28636F6E74726F6C2C206374726C2E706F736974696F6E293B0A2020202020202020202020207D293B0A20202020202020';
wwv_flow_imp.g_varchar2_table(12) := '207D293B0A202020207D0A7D3B0A0A66756E6374696F6E20637265617465436F6E74726F6C286974656D4E616D652C2069636F6E5F68746D6C2C206A735F616374696F6E29207B0A20202020636C61737320436F6E74726F6C207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(13) := '6F6E416464286D617029207B0A202020202020202020202020746869732E5F6D6170203D206D61703B0A202020202020202020202020746869732E5F636F6E7461696E6572203D20646F63756D656E742E637265617465456C656D656E74282764697627';
wwv_flow_imp.g_varchar2_table(14) := '293B0A202020202020202020202020746869732E5F636F6E7461696E65722E636C6173734E616D65203D20276D61706C69627265676C2D6374726C206D61706C69627265676C2D6374726C2D67726F757020637573746F6D2D636F6E74726F6C2D636F6E';
wwv_flow_imp.g_varchar2_table(15) := '7461696E6572273B0A202020202020202020202020746869732E5F636F6E7461696E65722E7374796C652E706F736974696F6E203D202772656C6174697665273B0A0A202020202020202020202020636F6E737420627574746F6E203D20646F63756D65';
wwv_flow_imp.g_varchar2_table(16) := '6E742E637265617465456C656D656E742827627574746F6E27293B0A202020202020202020202020627574746F6E2E74797065203D2027627574746F6E273B0A202020202020202020202020627574746F6E2E7469746C65203D206974656D4E616D653B';
wwv_flow_imp.g_varchar2_table(17) := '0A202020202020202020202020627574746F6E2E636C6173734E616D65203D2027612D427574746F6E20612D427574746F6E2D2D6E6F4C6162656C273B0A202020202020202020202020627574746F6E2E696E6E657248544D4C203D2069636F6E5F6874';
wwv_flow_imp.g_varchar2_table(18) := '6D6C207C7C206974656D4E616D653B0A0A202020202020202020202020627574746F6E2E6164644576656E744C697374656E65722827636C69636B272C202829203D3E207B0A20202020202020202020202020202020696620286A735F616374696F6E29';
wwv_flow_imp.g_varchar2_table(19) := '207B0A2020202020202020202020202020202020202020747279207B0A202020202020202020202020202020202020202020202020286E65772046756E6374696F6E28276D6170272C206A735F616374696F6E292928746869732E5F6D6170293B0A2020';
wwv_flow_imp.g_varchar2_table(20) := '2020202020202020202020202020202020207D2063617463682028657829207B0A202020202020202020202020202020202020202020202020636F6E736F6C652E6572726F722827437573746F6D204A5320616374696F6E206572726F723A272C206578';
wwv_flow_imp.g_varchar2_table(21) := '293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020207D293B0A0A202020202020202020202020746869732E5F636F6E7461696E65722E617070656E644368696C6428';
wwv_flow_imp.g_varchar2_table(22) := '627574746F6E293B0A20202020202020202020202072657475726E20746869732E5F636F6E7461696E65723B0A20202020202020207D0A20202020202020206F6E52656D6F76652829207B0A202020202020202020202020746869732E5F636F6E746169';
wwv_flow_imp.g_varchar2_table(23) := '6E65722E72656D6F766528293B0A202020202020202020202020746869732E5F6D6170203D20756E646566696E65643B0A20202020202020207D0A202020207D0A2020202072657475726E206E657720436F6E74726F6C28293B0A7D0A';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(40314578441115798)
,p_plugin_id=>wwv_flow_imp.id(40312379189115768)
,p_file_name=>'plugin_index.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '66756E6374696F6E20637265617465436F6E74726F6C286F2C6E2C74297B72657475726E206E657720636C6173737B6F6E4164642869297B746869732E5F6D61703D692C746869732E5F636F6E7461696E65723D646F63756D656E742E63726561746545';
wwv_flow_imp.g_varchar2_table(2) := '6C656D656E74282264697622292C746869732E5F636F6E7461696E65722E636C6173734E616D653D226D61706C69627265676C2D6374726C206D61706C69627265676C2D6374726C2D67726F757020637573746F6D2D636F6E74726F6C2D636F6E746169';
wwv_flow_imp.g_varchar2_table(3) := '6E6572222C746869732E5F636F6E7461696E65722E7374796C652E706F736974696F6E3D2272656C6174697665223B636F6E737420653D646F63756D656E742E637265617465456C656D656E742822627574746F6E22293B72657475726E20652E747970';
wwv_flow_imp.g_varchar2_table(4) := '653D22627574746F6E222C652E7469746C653D6F2C652E636C6173734E616D653D22612D427574746F6E20612D427574746F6E2D2D6E6F4C6162656C222C652E696E6E657248544D4C3D6E7C7C6F2C652E6164644576656E744C697374656E6572282263';
wwv_flow_imp.g_varchar2_table(5) := '6C69636B222C2828293D3E7B69662874297472797B6E65772046756E6374696F6E28226D6170222C742928746869732E5F6D6170297D6361746368286F297B636F6E736F6C652E6572726F722822437573746F6D204A5320616374696F6E206572726F72';
wwv_flow_imp.g_varchar2_table(6) := '3A222C6F297D7D29292C746869732E5F636F6E7461696E65722E617070656E644368696C642865292C746869732E5F636F6E7461696E65727D6F6E52656D6F766528297B746869732E5F636F6E7461696E65722E72656D6F766528292C746869732E5F6D';
wwv_flow_imp.g_varchar2_table(7) := '61703D766F696420307D7D7D77696E646F772E6D6170436F6E74726F6C3D77696E646F772E6D6170436F6E74726F6C7C7C7B7D2C77696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E3D7B7D2C77696E646F772E6D6170';
wwv_flow_imp.g_varchar2_table(8) := '436F6E74726F6C2E696E69743D66756E6374696F6E286F2C6E2C742C692C65297B77696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6E5D7C7C2877696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C7342';
wwv_flow_imp.g_varchar2_table(9) := '79526567696F6E5B6E5D3D5B5D292C77696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6E5D2E70757368287B6974656D4E616D653A6F2C706F736974696F6E3A742C69636F6E5F68746D6C3A692C6A735F61637469';
wwv_flow_imp.g_varchar2_table(10) := '6F6E3A657D293B76617220613D24282223222B6E293B612E6461746128226D632D696E697422297C7C28612E6461746128226D632D696E6974222C2130292C612E6F6E28227370617469616C6D6170696E697469616C697A65642E4D41505F524547494F';
wwv_flow_imp.g_varchar2_table(11) := '4E222C2866756E6374696F6E286F297B76617220743D617065782E726567696F6E286E292E63616C6C28226765744D61704F626A65637422293B743F2877696E646F772E6D6170436F6E74726F6C2E636F6E74726F6C734279526567696F6E5B6E5D7C7C';
wwv_flow_imp.g_varchar2_table(12) := '5B5D292E666F7245616368282866756E6374696F6E286F297B636F6E7374206E3D637265617465436F6E74726F6C286F2E6974656D4E616D652C6F2E69636F6E5F68746D6C2C6F2E6A735F616374696F6E293B742E616464436F6E74726F6C286E2C6F2E';
wwv_flow_imp.g_varchar2_table(13) := '706F736974696F6E297D29293A636F6E736F6C652E6572726F7228224D617020636F756C64206E6F74206265207265747269657665642E22297D2929297D3B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(40561289978014798)
,p_plugin_id=>wwv_flow_imp.id(40312379189115768)
,p_file_name=>'plugin_index.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
