From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 11/22] drm/vc4: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 28 Jun 2019 18:01:25 +0200
Message-ID: <980ef1af2d03820f2f55f42547664ed08f75e3e7.1561735433.git.andrzej.p@collabora.com>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 87ad0879edf3..b46df3aa1798 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -75,7 +75,6 @@ struct vc4_hdmi {
 
 	struct vc4_hdmi_audio audio;
 
-	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
 	int hpd_gpio;
@@ -206,7 +205,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		return connector_status_disconnected;
 	}
 
-	if (drm_probe_ddc(vc4->hdmi->ddc))
+	if (drm_probe_ddc(connector->ddc))
 		return connector_status_connected;
 
 	if (HDMI_READ(VC4_HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
@@ -232,7 +231,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	int ret = 0;
 	struct edid *edid;
 
-	edid = drm_get_edid(connector, vc4->hdmi->ddc);
+	edid = drm_get_edid(connector, connector->ddc);
 	cec_s_phys_addr_from_edid(vc4->hdmi->cec_adap, edid);
 	if (!edid)
 		return -ENODEV;
@@ -1287,6 +1286,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_hdmi *hdmi;
 	struct vc4_hdmi_encoder *vc4_hdmi_encoder;
 	struct device_node *ddc_node;
+	struct i2c_adapter *ddc;
 	u32 value;
 	int ret;
 
@@ -1334,9 +1334,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 	}
 
-	hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
+	ddc = of_find_i2c_adapter_by_node(ddc_node);
 	of_node_put(ddc_node);
-	if (!hdmi->ddc) {
+	if (ddc) {
 		DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
 		return -EPROBE_DEFER;
 	}
@@ -1396,6 +1396,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		ret = PTR_ERR(hdmi->connector);
 		goto err_destroy_encoder;
 	}
+	hdmi->connector->ddc = ddc;
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
@@ -1448,7 +1449,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
 err_put_i2c:
-	put_device(&hdmi->ddc->dev);
+	put_device(&ddc->dev);
 
 	return ret;
 }
@@ -1459,6 +1460,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
 	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct i2c_adapter *ddc = hdmi->connector->ddc;
 
 	cec_unregister_adapter(hdmi->cec_adap);
 	vc4_hdmi_connector_destroy(hdmi->connector);
@@ -1467,7 +1469,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
 
-	put_device(&hdmi->ddc->dev);
+	put_device(&ddc->dev);
 
 	vc4->hdmi = NULL;
 }
-- 
2.17.1
