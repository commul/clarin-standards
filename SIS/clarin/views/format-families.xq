xquery version "3.0";

declare namespace exist = "http://exist.sourceforge.net/NS/exist";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes doctype-system=about:legacy-compat";

import module namespace menu = "http://clarin.ids-mannheim.de/standards/menu" at "../modules/menu.xql";
import module namespace app = "http://clarin.ids-mannheim.de/standards/app" at "../modules/app.xql";
import module namespace fm = "http://clarin.ids-mannheim.de/standards/format-module" at "../modules/format.xql";
import module namespace ff = "http://clarin.ids-mannheim.de/standards/format-family" at "../modules/format-family.xql";

let $sortBy := request:get-parameter('sortBy', '')
return

<html>
    <head>
        <title>Format Families</title>
        <link rel="stylesheet" type="text/css" href="{app:resource("style.css", "css")}"/>
        <script type="text/javascript" src="{app:resource("d3.v2.js", "js")}"/>
        <script type="text/javascript" src="{app:resource("forcegraph.js", "js")}"/>
    </head>
    <body onload="drawGraph('{ff:create-graph-json()}','650','650','-90');">
        <div id="all">
            <div class="logoheader"/>
            {menu:view()}
            <div class="content">
                <div class="navigation">&gt; <a href="{app:link("views/format-families.xq")}">Format Families</a>
                    <table>
                        <tr>
                            <th><a href="{app:link("views/format-families.xq?sortBy=id")}">Format</a></th>
                            <th><a href="{app:link("views/format-families.xq?sortBy=ff")}">Format Family</a></th>
                        </tr>
                        {fm:get-format-families($sortBy)}
                    </table>
                    <div id="chart" class="version"></div>
                </div>
            </div>
            <div class="footer">{app:footer()}</div>
        </div>
    </body>
</html>