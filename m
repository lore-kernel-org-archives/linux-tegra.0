From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 2/4] drm/vc4: Provide ddc symlink in connector sysfs directory
Date: Thu,  2 Jan 2020 14:22:58 +0100
Message-ID: <20200102132300.24309-3-andrzej.p@collabora.com>
References: <20200102132300.24309-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20200102132300.24309-1-andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1c62c6c9244b..cea18dc15f77 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -267,7 +267,8 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
-						     struct drm_encoder *encoder)
+						     struct drm_encoder *encoder,
+						     struct i2c_adapter *ddc)
 {
 	struct drm_connector *connector;
 	struct vc4_hdmi_connector *hdmi_connector;
@@ -281,8 +282,10 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 
 	hdmi_connector->encoder = encoder;
 
-	drm_connector_init(dev, connector, &vc4_hdmi_connector_funcs,
-			   DRM_MODE_CONNECTOR_HDMIA);
+	drm_connector_init_with_ddc(dev, connector,
+				    &vc4_hdmi_connector_funcs,
+				    DRM_MODE_CONNECTOR_HDMIA,
+				    ddc);
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/* Create and attach TV margin props to this connector. */
@@ -1395,7 +1398,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	hdmi->connector = vc4_hdmi_connector_init(drm, hdmi->encoder);
+	hdmi->connector =
+		vc4_hdmi_connector_init(drm, hdmi->encoder, hdmi->ddc);
 	if (IS_ERR(hdmi->connector)) {
 		ret = PTR_ERR(hdmi->connector);
 		goto err_destroy_encoder;
-- 
2.17.1
