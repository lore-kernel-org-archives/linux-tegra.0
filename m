From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 19/22] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 28 Jun 2019 18:01:33 +0200
Message-ID: <c2dc5ba93148ff034bf42cceb02a807674731c84.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>David
List-Id: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index c6490949d9db..0b9c9f2619da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -161,7 +161,6 @@ struct dw_hdmi {
 
 	struct drm_display_mode previous_mode;
 
-	struct i2c_adapter *ddc;
 	void __iomem *regs;
 	bool sink_is_hdmi;
 	bool sink_has_audio;
@@ -1118,7 +1117,7 @@ static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi)
 		return false;
 
 	/* Disable if no DDC bus */
-	if (!hdmi->ddc)
+	if (!hdmi->connector.ddc)
 		return false;
 
 	/* Disable if SCDC is not supported, or if an HF-VSDB block is absent */
@@ -1156,10 +1155,11 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi)
 
 	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
 	if (dw_hdmi_support_scdc(hdmi)) {
+		struct i2c_adapter *ddc = hdmi->connector.ddc;
 		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
-			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
+			drm_scdc_set_high_tmds_clock_ratio(ddc, 1);
 		else
-			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 0);
+			drm_scdc_set_high_tmds_clock_ratio(ddc, 0);
 	}
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_high_tmds_clock_ratio);
@@ -1750,6 +1750,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	if (dw_hdmi_support_scdc(hdmi)) {
 		if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		    hdmi_info->scdc.scrambling.low_rates) {
+			struct i2c_adapter *ddc = hdmi->connector.ddc;
 			/*
 			 * HDMI2.0 Specifies the following procedure:
 			 * After the Source Device has determined that
@@ -1759,13 +1760,12 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 			 * Source Devices compliant shall set the
 			 * Source Version = 1.
 			 */
-			drm_scdc_readb(hdmi->ddc, SCDC_SINK_VERSION,
-				       &bytes);
-			drm_scdc_writeb(hdmi->ddc, SCDC_SOURCE_VERSION,
+			drm_scdc_readb(ddc, SCDC_SINK_VERSION, &bytes);
+			drm_scdc_writeb(ddc, SCDC_SOURCE_VERSION,
 				min_t(u8, bytes, SCDC_MIN_SOURCE_VERSION));
 
 			/* Enabled Scrambling in the Sink */
-			drm_scdc_set_scrambling(hdmi->ddc, 1);
+			drm_scdc_set_scrambling(hdmi->connector.ddc, 1);
 
 			/*
 			 * To activate the scrambler feature, you must ensure
@@ -1781,7 +1781,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 			hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
 			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
 				    HDMI_MC_SWRSTZ);
-			drm_scdc_set_scrambling(hdmi->ddc, 0);
+			drm_scdc_set_scrambling(hdmi->connector.ddc, 0);
 		}
 	}
 
@@ -2127,10 +2127,10 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret = 0;
 
-	if (!hdmi->ddc)
+	if (!hdmi->connector.ddc)
 		return 0;
 
-	edid = drm_get_edid(connector, hdmi->ddc);
+	edid = drm_get_edid(connector, hdmi->connector.ddc);
 	if (edid) {
 		dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
 			edid->width_cm, edid->height_cm);
@@ -2548,9 +2548,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
-		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
+		hdmi->connector.ddc = of_get_i2c_adapter_by_node(ddc_node);
 		of_node_put(ddc_node);
-		if (!hdmi->ddc) {
+		if (!hdmi->connector.ddc) {
 			dev_dbg(hdmi->dev, "failed to read ddc node\n");
 			return ERR_PTR(-EPROBE_DEFER);
 		}
@@ -2689,7 +2689,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	hdmi_init_clk_regenerator(hdmi);
 
 	/* If DDC bus is not specified, try to register HDMI I2C bus */
-	if (!hdmi->ddc) {
+	if (!hdmi->connector.ddc) {
 		/* Look for (optional) stuff related to unwedging */
 		hdmi->pinctrl = devm_pinctrl_get(dev);
 		if (!IS_ERR(hdmi->pinctrl)) {
@@ -2708,9 +2708,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 			}
 		}
 
-		hdmi->ddc = dw_hdmi_i2c_adapter(hdmi);
-		if (IS_ERR(hdmi->ddc))
-			hdmi->ddc = NULL;
+		hdmi->connector.ddc = dw_hdmi_i2c_adapter(hdmi);
+		if (IS_ERR(hdmi->connector.ddc))
+			hdmi->connector.ddc = NULL;
 	}
 
 	hdmi->bridge.driver_private = hdmi;
@@ -2776,7 +2776,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 err_iahb:
 	if (hdmi->i2c) {
 		i2c_del_adapter(&hdmi->i2c->adap);
-		hdmi->ddc = NULL;
+		hdmi->connector.ddc = NULL;
 	}
 
 	if (hdmi->cec_notifier)
@@ -2788,7 +2788,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 err_isfr:
 	clk_disable_unprepare(hdmi->isfr_clk);
 err_res:
-	i2c_put_adapter(hdmi->ddc);
+	i2c_put_adapter(hdmi->connector.ddc);
 
 	return ERR_PTR(ret);
 }
@@ -2814,7 +2814,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	if (hdmi->i2c)
 		i2c_del_adapter(&hdmi->i2c->adap);
 	else
-		i2c_put_adapter(hdmi->ddc);
+		i2c_put_adapter(hdmi->connector.ddc);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.17.1
