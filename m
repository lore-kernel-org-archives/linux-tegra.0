From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 18/22] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 28 Jun 2019 18:01:32 +0200
Message-ID: <33d98ef0c2a6e402515dc3ed5d100959dcb3233c.1561735433.git.andrzej.p@collabora.com>
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
 drivers/gpu/drm/bridge/dumb-vga-dac.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index d32885b906ae..b4cc3238400a 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -20,7 +20,6 @@ struct dumb_vga {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
 
-	struct i2c_adapter	*ddc;
 	struct regulator	*vdd;
 };
 
@@ -42,10 +41,10 @@ static int dumb_vga_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (IS_ERR(vga->ddc))
+	if (IS_ERR(vga->connector.ddc))
 		goto fallback;
 
-	edid = drm_get_edid(connector, vga->ddc);
+	edid = drm_get_edid(connector, vga->connector.ddc);
 	if (!edid) {
 		DRM_INFO("EDID readout failed, falling back to standard modes\n");
 		goto fallback;
@@ -84,7 +83,7 @@ dumb_vga_connector_detect(struct drm_connector *connector, bool force)
 	 * wire the DDC pins, or the I2C bus might not be working at
 	 * all.
 	 */
-	if (!IS_ERR(vga->ddc) && drm_probe_ddc(vga->ddc))
+	if (!IS_ERR(vga->connector.ddc) && drm_probe_ddc(vga->connector.ddc))
 		return connector_status_connected;
 
 	return connector_status_unknown;
@@ -190,14 +189,14 @@ static int dumb_vga_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
 	}
 
-	vga->ddc = dumb_vga_retrieve_ddc(&pdev->dev);
-	if (IS_ERR(vga->ddc)) {
-		if (PTR_ERR(vga->ddc) == -ENODEV) {
+	vga->connector.ddc = dumb_vga_retrieve_ddc(&pdev->dev);
+	if (IS_ERR(vga->connector.ddc)) {
+		if (PTR_ERR(vga->connector.ddc) == -ENODEV) {
 			dev_dbg(&pdev->dev,
 				"No i2c bus specified. Disabling EDID readout\n");
 		} else {
 			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
-			return PTR_ERR(vga->ddc);
+			return PTR_ERR(vga->connector.ddc);
 		}
 	}
 
@@ -216,8 +215,8 @@ static int dumb_vga_remove(struct platform_device *pdev)
 
 	drm_bridge_remove(&vga->bridge);
 
-	if (!IS_ERR(vga->ddc))
-		i2c_put_adapter(vga->ddc);
+	if (!IS_ERR(vga->connector.ddc))
+		i2c_put_adapter(vga->connector.ddc);
 
 	return 0;
 }
-- 
2.17.1
