From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 08/22] drm/tegra: Provide ddc symlink in output connector
 sysfs directory
Date: Fri, 28 Jun 2019 18:01:22 +0200
Message-ID: <e4bcdb2accad3b0564a49d611cd27451a2705aa1.1561735433.git.andrzej.p@collabora.com>
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
 drivers/gpu/drm/tegra/drm.h    |  1 -
 drivers/gpu/drm/tegra/output.c | 12 ++++++------
 drivers/gpu/drm/tegra/sor.c    |  6 +++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 86daa19fcf24..9bf72bcd3ec1 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -120,7 +120,6 @@ struct tegra_output {
 	struct device *dev;
 
 	struct drm_panel *panel;
-	struct i2c_adapter *ddc;
 	const struct edid *edid;
 	struct cec_notifier *cec;
 	unsigned int hpd_irq;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 274cb955e2e1..0b5037a29c63 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -30,8 +30,8 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
 
 	if (output->edid)
 		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
-	else if (output->ddc)
-		edid = drm_get_edid(connector, output->ddc);
+	else if (connector->ddc)
+		edid = drm_get_edid(connector, connector->ddc);
 
 	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
 	drm_connector_update_edid_property(connector, edid);
@@ -111,8 +111,8 @@ int tegra_output_probe(struct tegra_output *output)
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
-		output->ddc = of_find_i2c_adapter_by_node(ddc);
-		if (!output->ddc) {
+		output->connector.ddc = of_find_i2c_adapter_by_node(ddc);
+		if (!output->connector.ddc) {
 			err = -EPROBE_DEFER;
 			of_node_put(ddc);
 			return err;
@@ -174,8 +174,8 @@ void tegra_output_remove(struct tegra_output *output)
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 
-	if (output->ddc)
-		put_device(&output->ddc->dev);
+	if (output->connector.ddc)
+		put_device(&output->connector.ddc->dev);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4ffe3794e6d3..77e61f98de07 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2311,7 +2311,7 @@ static void tegra_sor_hdmi_disable_scrambling(struct tegra_sor *sor)
 
 static void tegra_sor_hdmi_scdc_disable(struct tegra_sor *sor)
 {
-	struct i2c_adapter *ddc = sor->output.ddc;
+	struct i2c_adapter *ddc = sor->output.connector.ddc;
 
 	drm_scdc_set_high_tmds_clock_ratio(ddc, false);
 	drm_scdc_set_scrambling(ddc, false);
@@ -2339,7 +2339,7 @@ static void tegra_sor_hdmi_enable_scrambling(struct tegra_sor *sor)
 
 static void tegra_sor_hdmi_scdc_enable(struct tegra_sor *sor)
 {
-	struct i2c_adapter *ddc = sor->output.ddc;
+	struct i2c_adapter *ddc = sor->output.connector.ddc;
 
 	drm_scdc_set_high_tmds_clock_ratio(ddc, true);
 	drm_scdc_set_scrambling(ddc, true);
@@ -2350,7 +2350,7 @@ static void tegra_sor_hdmi_scdc_enable(struct tegra_sor *sor)
 static void tegra_sor_hdmi_scdc_work(struct work_struct *work)
 {
 	struct tegra_sor *sor = container_of(work, struct tegra_sor, scdc.work);
-	struct i2c_adapter *ddc = sor->output.ddc;
+	struct i2c_adapter *ddc = sor->output.connector.ddc;
 
 	if (!drm_scdc_get_scrambling_status(ddc)) {
 		DRM_DEBUG_KMS("SCDC not scrambled\n");
-- 
2.17.1
