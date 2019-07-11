From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it wasn't specified
Date: Thu, 11 Jul 2019 05:13:13 +0300
Message-ID: <20190711021313.29445-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The rotation mode from cmdline shouldn't be taken into account if it
wasn't specified in the cmdline. This fixes ignored default display
orientation when display mode is given using cmdline without the
rotation being specified.

Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on the commandline")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 56d36779d213..c8922b7cac09 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -859,7 +859,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	 * simple XOR between the two handle the addition nicely.
 	 */
 	cmdline = &connector->cmdline_mode;
-	if (cmdline->specified) {
+	if (cmdline->specified && cmdline->rotation_reflection) {
 		unsigned int cmdline_rest, panel_rest;
 		unsigned int cmdline_rot, panel_rot;
 		unsigned int sum_rot, sum_rest;
-- 
2.22.0
