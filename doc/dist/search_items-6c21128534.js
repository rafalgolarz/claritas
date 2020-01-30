searchNodes=[{"ref":"Claritas.html","title":"Claritas","type":"module","doc":"Claritas lighten or darken color (hexadecimal) by integer value."},{"ref":"Claritas.html#shift/2","title":"Claritas.shift/2","type":"function","doc":"Shift brightness (up or down) of the given hexadecimal color by integer value brightness_change. Parameters: color: color in hexadecimal format (#RRGGBB) brightness_change: integer value Examples # positive values are lightening the color iex&gt; Claritas.shift(&quot;#f06d06&quot;, 30) {:ok, &quot;#FF8B24&quot;} # negative values are darkening the color iex&gt; Claritas.shift(&quot;#f06d06&quot;, -30) {:ok, &quot;#D24F00&quot;} Dynamically increase/decrease brightness of your colors. Controller: def index(conn, _params) do shades = for i &lt;- 1..20, into: [] do Claritas.shift(&quot;#141C5B&quot;, 10 * i) end render(conn, &quot;index.html&quot;, shades: shades) end Template: &lt;ul&gt; &lt;%= for {_, shade} &lt;- @shades do %&gt; &lt;li&gt;&lt;span style=&#39;background-color: &lt;%= shade %&gt;&#39;&gt;&lt;%= shade %&gt;&lt;/span&gt;&lt;/li&gt; &lt;% end %&gt; &lt;/ul&gt;"}]