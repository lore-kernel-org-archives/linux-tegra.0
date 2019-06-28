From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 20/22] drm/bridge: ti-tfp410: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 28 Jun 2019 18:01:34 +0200
Message-ID: <890f701b0722295ef2f03c89e14271ee11487743.1561735433.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krz>
List-Id: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index dbf35c7bc85e..e55358f0a5ba 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -26,7 +26,6 @@ struct tfp410 {
 	unsigned int		connector_type;
 
 	u32			bus_format;
-	struct i2c_adapter	*ddc;
 	struct gpio_desc	*hpd;
 	int			hpd_irq;
 	struct delayed_work	hpd_work;
@@ -55,10 +54,10 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (!dvi->ddc)
+	if (!dvi->connector.ddc)
 		goto fallback;
 
-	edid = drm_get_edid(connector, dvi->ddc);
+	edid = drm_get_edid(connector, dvi->connector.ddc);
 	if (!edid) {
 		DRM_INFO("EDID read failed. Fallback to standard modes\n");
 		goto fallback;
@@ -98,8 +97,8 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 			return connector_status_disconnected;
 	}
 
-	if (dvi->ddc) {
-		if (drm_probe_ddc(dvi->ddc))
+	if (dvi->connector.ddc) {
+		if (drm_probe_ddc(dvi->connector.ddc))
 			return connector_status_connected;
 		else
 			return connector_status_disconnected;
@@ -297,8 +296,8 @@ static int tfp410_get_connector_properties(struct tfp410 *dvi)
 	if (!ddc_phandle)
 		goto fail;
 
-	dvi->ddc = of_get_i2c_adapter_by_node(ddc_phandle);
-	if (dvi->ddc)
+	dvi->connector.ddc = of_get_i2c_adapter_by_node(ddc_phandle);
+	if (dvi->connector.ddc)
 		dev_info(dvi->dev, "Connector's ddc i2c bus found\n");
 	else
 		ret = -EPROBE_DEFER;
@@ -367,7 +366,7 @@ static int tfp410_init(struct device *dev, bool i2c)
 
 	return 0;
 fail:
-	i2c_put_adapter(dvi->ddc);
+	i2c_put_adapter(dvi->connector.ddc);
 	if (dvi->hpd)
 		gpiod_put(dvi->hpd);
 	return ret;
@@ -382,8 +381,8 @@ static int tfp410_fini(struct device *dev)
 
 	drm_bridge_remove(&dvi->bridge);
 
-	if (dvi->ddc)
-		i2c_put_adapter(dvi->ddc);
+	if (dvi->connector.ddc)
+		i2c_put_adapter(dvi->connector.ddc);
 	if (dvi->hpd)
 		gpiod_put(dvi->hpd);
 
-- 
2.17.1
