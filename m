From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 06/22] drm/sun4i: hdmi: Provide ddc symlink in sun4i hdmi
 connector sysfs directory
Date: Fri, 28 Jun 2019 18:01:20 +0200
Message-ID: <4fa046adb68a57c0ee63f5d31da8af2ed8de2c57.1561735433.git.andrzej.p@collabora.com>
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
 drivers/gpu/drm/sun4i/sun4i_hdmi.h     |  1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 14 +++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index 7ad3f06c127e..1649273b1493 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -265,7 +265,6 @@ struct sun4i_hdmi {
 	struct clk		*tmds_clk;
 
 	struct i2c_adapter	*i2c;
-	struct i2c_adapter	*ddc_i2c;
 
 	/* Regmap fields for I2C adapter */
 	struct regmap_field	*field_ddc_en;
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 9c3f99339b82..250bec00dc35 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -213,7 +213,7 @@ static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	edid = drm_get_edid(connector, hdmi->ddc_i2c ?: hdmi->i2c);
+	edid = drm_get_edid(connector, connector->ddc ?: hdmi->i2c);
 	if (!edid)
 		return 0;
 
@@ -598,11 +598,11 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_mod_clk;
 	}
 
-	hdmi->ddc_i2c = sun4i_hdmi_get_ddc(dev);
-	if (IS_ERR(hdmi->ddc_i2c)) {
-		ret = PTR_ERR(hdmi->ddc_i2c);
+	hdmi->connector.ddc = sun4i_hdmi_get_ddc(dev);
+	if (IS_ERR(hdmi->connector.ddc)) {
+		ret = PTR_ERR(hdmi->connector.ddc);
 		if (ret == -ENODEV)
-			hdmi->ddc_i2c = NULL;
+			hdmi->connector.ddc = NULL;
 		else
 			goto err_del_i2c_adapter;
 	}
@@ -663,7 +663,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 	cec_delete_adapter(hdmi->cec_adap);
 	drm_encoder_cleanup(&hdmi->encoder);
 err_put_ddc_i2c:
-	i2c_put_adapter(hdmi->ddc_i2c);
+	i2c_put_adapter(hdmi->connector.ddc);
 err_del_i2c_adapter:
 	i2c_del_adapter(hdmi->i2c);
 err_disable_mod_clk:
@@ -684,7 +684,7 @@ static void sun4i_hdmi_unbind(struct device *dev, struct device *master,
 	drm_connector_cleanup(&hdmi->connector);
 	drm_encoder_cleanup(&hdmi->encoder);
 	i2c_del_adapter(hdmi->i2c);
-	i2c_put_adapter(hdmi->ddc_i2c);
+	i2c_put_adapter(hdmi->connector.ddc);
 	clk_disable_unprepare(hdmi->mod_clk);
 	clk_disable_unprepare(hdmi->bus_clk);
 }
-- 
2.17.1
