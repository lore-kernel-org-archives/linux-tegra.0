From: "Tristan Bastian" <Tristan-C.Bastian@gmx.de>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Mon, 28 Jan 2019 10:19:50 +0100
Message-ID: <trinity-f11f9fb4-ae78-4c41-9b41-1b381b237ff2-1548667190142@3c-app-gmx-bs34>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <844544bc-10ac-a236-8c7d-17a09288fe5d@gmx.de> <20190128080815.GD18124@ulmo>
 <20190128081055.GE18124@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771552872=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190128081055.GE18124@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Vlado Plaga <rechner@vlado-do.de>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--===============1771552872==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div>Didn&#39;t knew about that line, sorry..</div>

<div>Sure you can include that.</div>

<div>I&#39;m hoping patchwork won&#39;t thing it got tested twice by me..</div>

<div>&nbsp;</div>

<div>Tested-by: Tristan Bastian &lt;tristan-c.bastian@gmx.de&gt;</div>

<div>&nbsp;
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Gesendet:</b>&nbsp;Montag, 28. Januar 2019 um 09:10 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Thierry Reding&quot; &lt;thierry.reding@gmail.com&gt;<br/>
<b>An:</b>&nbsp;&quot;Tristan Bastian&quot; &lt;tristan-c.bastian@gmx.de&gt;<br/>
<b>Cc:</b>&nbsp;&quot;Wolfram Sang&quot; &lt;wsa@the-dreams.de&gt;, &quot;Rob Herring&quot; &lt;robh+dt@kernel.org&gt;, &quot;Lucas Stach&quot; &lt;l.stach@pengutronix.de&gt;, &quot;Andrzej Hajda&quot; &lt;a.hajda@samsung.com&gt;, &quot;Vlado Plaga&quot; &lt;rechner@vlado-do.de&gt;, linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org<br/>
<b>Betreff:</b>&nbsp;Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent</div>

<div name="quoted-content">On Mon, Jan 28, 2019 at 09:08:15AM +0100, Thierry Reding wrote:<br/>
&gt; On Sat, Jan 26, 2019 at 01:37:34PM +0100, Tristan Bastian wrote:<br/>
&gt; &gt; Am 25.01.19 um 14:11 schrieb Thierry Reding:<br/>
&gt; &gt; &gt; From: Thierry Reding &lt;treding@nvidia.com&gt;<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; If an I2C adapter doesn&#39;t match the provided device tree node, also try<br/>
&gt; &gt; &gt; matching the parent&#39;s device tree node. This allows finding an adapter<br/>
&gt; &gt; &gt; based on the device node of the parent device that was used to register<br/>
&gt; &gt; &gt; it.<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; This fixes a regression on Tegra124-based Chromebooks (Nyan) where the<br/>
&gt; &gt; &gt; eDP controller registers an I2C adapter that is used to read to EDID.<br/>
&gt; &gt; &gt; After commit 993a815dcbb2 (&quot;dt-bindings: panel: Add missing .txt<br/>
&gt; &gt; &gt; suffix&quot;) this stopped working because the I2C adapter could no longer<br/>
&gt; &gt; &gt; be found. The approach in this patch fixes the regression without<br/>
&gt; &gt; &gt; introducing the issues that the above commit solved.<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; Fixes: 17ab7806de0c (&quot;drm: don&#39;t link DP aux i2c adapter to the hardware device node&quot;)<br/>
&gt; &gt; &gt; Signed-off-by: Thierry Reding &lt;treding@nvidia.com&gt;<br/>
&gt; &gt; &gt; ---<br/>
&gt; &gt; &gt; Changes in v2:<br/>
&gt; &gt; &gt; - check for both device and parent device tree nodes for each device<br/>
&gt; &gt; &gt; instead of looping through the list of devices twice<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; drivers/i2c/i2c-core-of.c &#124; 14 +++++++++++++-<br/>
&gt; &gt; &gt; 1 file changed, 13 insertions(+), 1 deletion(-)<br/>
&gt; &gt; &gt;<br/>
&gt; &gt; &gt; diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c<br/>
&gt; &gt; &gt; index 6cb7ad608bcd..0f01cdba9d2c 100644<br/>
&gt; &gt; &gt; --- a/drivers/i2c/i2c-core-of.c<br/>
&gt; &gt; &gt; +++ b/drivers/i2c/i2c-core-of.c<br/>
&gt; &gt; &gt; @@ -121,6 +121,17 @@ static int of_dev_node_match(struct device *dev, void *data)<br/>
&gt; &gt; &gt; return dev-&gt;of_node == data;<br/>
&gt; &gt; &gt; }<br/>
&gt; &gt; &gt; +static int of_dev_or_parent_node_match(struct device *dev, void *data)<br/>
&gt; &gt; &gt; +{<br/>
&gt; &gt; &gt; + if (dev-&gt;of_node == data)<br/>
&gt; &gt; &gt; + return 1;<br/>
&gt; &gt; &gt; +<br/>
&gt; &gt; &gt; + if (dev-&gt;parent)<br/>
&gt; &gt; &gt; + return dev-&gt;parent-&gt;of_node == data;<br/>
&gt; &gt; &gt; +<br/>
&gt; &gt; &gt; + return 0;<br/>
&gt; &gt; &gt; +}<br/>
&gt; &gt; &gt; +<br/>
&gt; &gt; &gt; /* must call put_device() when done with returned i2c_client device */<br/>
&gt; &gt; &gt; struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)<br/>
&gt; &gt; &gt; {<br/>
&gt; &gt; &gt; @@ -145,7 +156,8 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)<br/>
&gt; &gt; &gt; struct device *dev;<br/>
&gt; &gt; &gt; struct i2c_adapter *adapter;<br/>
&gt; &gt; &gt; - dev = bus_find_device(&amp;i2c_bus_type, NULL, node, of_dev_node_match);<br/>
&gt; &gt; &gt; + dev = bus_find_device(&amp;i2c_bus_type, NULL, node,<br/>
&gt; &gt; &gt; + of_dev_or_parent_node_match);<br/>
&gt; &gt; &gt; if (!dev)<br/>
&gt; &gt; &gt; return NULL;<br/>
&gt; &gt;<br/>
&gt; &gt; I&#39;ve tested this and can confirm that this fixes the issue on the nyan-big<br/>
&gt; &gt; chromebook.<br/>
&gt;<br/>
&gt; Excellent, thanks for testing! Typically if you&#39;ve tested a patch and<br/>
&gt; verified that it fixes the problem that you were seeing, it&#39;s good to<br/>
&gt; send this on a line by itself along with your reply:<br/>
&gt;<br/>
&gt; Tested-by: Tristan Bastian &lt;tristan-c.bastian@gmx.de&gt;<br/>
<br/>
Oh my... that was stupid. I think patchwork might now pick this up...<br/>
<br/>
This also made me realize that I should&#39;ve credited both Tristan and<br/>
Vlado as reporters in the commit message. I&#39;ll resend this.<br/>
<br/>
Tristan, is it okay if I include your Tested-by: tag in the v2?<br/>
<br/>
Thierry</div>
</div>
</div>
</div></div></body></html>

--===============1771552872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1771552872==--
