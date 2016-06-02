From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 03/20] drm: atmel-hlcdc: Rely on the default ->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:30 +0200
Message-ID: <1464877907-27723-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Alexey Brodkin <abrodkin@synopsys.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu
List-Id: linux-tegra@vger.kernel.org

We have a 1:1 relationship between connectors and encoders and the
driver is relying on the atomic helpers: we can drop the custom
->best_encoder() and let the core call drm_atomic_helper_best_encoder()
for us.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 39802c0..473a475 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -113,21 +113,9 @@ static int atmel_hlcdc_rgb_mode_valid(struct drm_connector *connector,
 	return atmel_hlcdc_dc_mode_valid(rgb->dc, mode);
 }
 
-
-
-static struct drm_encoder *
-atmel_hlcdc_rgb_best_encoder(struct drm_connector *connector)
-{
-	struct atmel_hlcdc_rgb_output *rgb =
-			drm_connector_to_atmel_hlcdc_rgb_output(connector);
-
-	return &rgb->encoder;
-}
-
 static const struct drm_connector_helper_funcs atmel_hlcdc_panel_connector_helper_funcs = {
 	.get_modes = atmel_hlcdc_panel_get_modes,
 	.mode_valid = atmel_hlcdc_rgb_mode_valid,
-	.best_encoder = atmel_hlcdc_rgb_best_encoder,
 };
 
 static enum drm_connector_status
-- 
2.7.4
