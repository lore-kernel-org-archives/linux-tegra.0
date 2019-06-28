From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 09/22] drm/imx: imx-ldb: Provide ddc symlink in connector's
 sysfs
Date: Fri, 28 Jun 2019 18:01:23 +0200
Message-ID: <c73f0b5c89797584e0bdf7feee1560d7a4c4cec1.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1561735433.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan
List-Id: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/gpu/drm/imx/imx-ldb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 383733302280..44fdb264339e 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -55,7 +55,6 @@ struct imx_ldb_channel {
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
-	struct i2c_adapter *ddc;
 	int chno;
 	void *edid;
 	int edid_len;
@@ -131,8 +130,8 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 			return num_modes;
 	}
 
-	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
-		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
+	if (!imx_ldb_ch->edid && connector->ddc)
+		imx_ldb_ch->edid = drm_get_edid(connector, connector->ddc);
 
 	if (imx_ldb_ch->edid) {
 		drm_connector_update_edid_property(connector,
@@ -550,15 +549,15 @@ static int imx_ldb_panel_ddc(struct device *dev,
 
 	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
 	if (ddc_node) {
-		channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
+		channel->connector.ddc = of_find_i2c_adapter_by_node(ddc_node);
 		of_node_put(ddc_node);
-		if (!channel->ddc) {
+		if (!channel->connector.ddc) {
 			dev_warn(dev, "failed to get ddc i2c adapter\n");
 			return -EPROBE_DEFER;
 		}
 	}
 
-	if (!channel->ddc) {
+	if (!channel->connector.ddc) {
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
@@ -725,7 +724,7 @@ static void imx_ldb_unbind(struct device *dev, struct device *master,
 			drm_panel_detach(channel->panel);
 
 		kfree(channel->edid);
-		i2c_put_adapter(channel->ddc);
+		i2c_put_adapter(channel->connector.ddc);
 	}
 }
 
-- 
2.17.1
