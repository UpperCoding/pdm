/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-12-10 05:08:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<!-- 导入jquery核心类库 -->\n");
      out.write("<script type=\"text/javascript\"\n");
      out.write("\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery-1.8.3.js\"></script>\n");
      out.write("<!-- 导入easyui类库 -->\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\n");
      out.write("\thref=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyui/themes/default/easyui.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\n");
      out.write("\thref=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyui/themes/icon.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\n");
      out.write("\thref=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyui/ext/portal.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\n");
      out.write("\thref=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/default.css\">\t\n");
      out.write("<script type=\"text/javascript\"\n");
      out.write("\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyui/jquery.easyui.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\"\n");
      out.write("\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyui/ext/jquery.portal.js\"></script>\n");
      out.write("<script type=\"text/javascript\"\n");
      out.write("\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/easyui/ext/jquery.cookie.js\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\t$(function() {\n");
      out.write("\t\tpanels = [ {\n");
      out.write("\t\t\tid : 'p1',\n");
      out.write("\t\t\ttitle : '公共栏',\n");
      out.write("\t\t\theight : 255,\n");
      out.write("\t\t\tcollapsible : true,\n");
      out.write("\t\t\thref:'page_portal_gonggao.action'\n");
      out.write("\t\t}, {\n");
      out.write("\t\t\tid : 'p2',\n");
      out.write("\t\t\ttitle : '代办事宜',\n");
      out.write("\t\t\theight : 255,\n");
      out.write("\t\t\tcollapsible : true,\n");
      out.write("\t\t\thref:'page_portal_daiban.action'\n");
      out.write("\t\t}, {\n");
      out.write("\t\t\tid : 'p3',\n");
      out.write("\t\t\ttitle : '预警信息',\n");
      out.write("\t\t\theight : 255,\n");
      out.write("\t\t\tcollapsible : true,\n");
      out.write("\t\t\thref:'page_portal_yujing.action'\n");
      out.write("\t\t}, {\n");
      out.write("\t\t\tid : 'p4',\n");
      out.write("\t\t\ttitle : '系统BUG反馈',\n");
      out.write("\t\t\theight : 255,\n");
      out.write("\t\t\tcollapsible : true,\n");
      out.write("\t\t\thref:'page_portal_bug.action'\n");
      out.write("\t\t}];\n");
      out.write("\t\t $('#layout_portal_portal').portal({\n");
      out.write("\t\t\tborder : false,\n");
      out.write("\t\t\tfit : true\n");
      out.write("\t\t });\n");
      out.write("\t\tvar state = state = 'p1,p2:p3,p4';/*冒号代表列，逗号代表行*/\n");
      out.write("\n");
      out.write("\t\taddPortalPanels(state);\n");
      out.write("\t\t$('#layout_portal_portal').portal('resize');\n");
      out.write("\t\n");
      out.write("\t});\n");
      out.write("\t\n");
      out.write("\tfunction getPanelOptions(id) {\n");
      out.write("\t\tfor ( var i = 0; i < panels.length; i++) {\n");
      out.write("\t\t\tif (panels[i].id == id) {\n");
      out.write("\t\t\t\treturn panels[i];\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\t\treturn undefined;\n");
      out.write("\t}\n");
      out.write("\tfunction getPortalState() {\n");
      out.write("\t\tvar aa=[];\n");
      out.write("\t\tfor(var columnIndex=0;columnIndex<2;columnIndex++) {\n");
      out.write("\t\t\tvar cc=[];\n");
      out.write("\t\t\tvar panels=$('#layout_portal_portal').portal('getPanels',columnIndex);\n");
      out.write("\t\t\tfor(var i=0;i<panels.length;i++) {\n");
      out.write("\t\t\t\tcc.push(panels[i].attr('id'));\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\taa.push(cc.join(','));\n");
      out.write("\t\t}\n");
      out.write("\t\treturn aa.join(':');\n");
      out.write("\t}\n");
      out.write("\tfunction addPortalPanels(portalState) {\n");
      out.write("\t\tvar columns = portalState.split(':');\n");
      out.write("\t\tfor (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {\n");
      out.write("\t\t\tvar cc = columns[columnIndex].split(',');\n");
      out.write("\t\t\tfor (var j = 0; j < cc.length; j++) {\n");
      out.write("\t\t\t\tvar options = getPanelOptions(cc[j]);\n");
      out.write("\t\t\t\tif (options) {\n");
      out.write("\t\t\t\t\tvar p = $('<div/>').attr('id', options.id).appendTo('body');\n");
      out.write("\t\t\t\t\tp.panel(options);\n");
      out.write("\t\t\t\t\t$('#layout_portal_portal').portal('add', {\n");
      out.write("\t\t\t\t\t\tpanel : p,\n");
      out.write("\t\t\t\t\t\tcolumnIndex : columnIndex\n");
      out.write("\t\t\t\t\t});\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\t}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div id=\"layout_portal_portal\" style=\"position:relative;height:600px;\">\n");
      out.write("\t\t<div></div>\n");
      out.write("\t\t<div></div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
