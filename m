From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] drm: tegra: Check return value of drm_vblank_get()
Date: Thu, 9 Oct 2014 18:16:49 +0900
Message-ID: <1412846209-28630-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

drm_vblank_get() can return an error, which we should propagate.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6553fd238685..b08df07cad47 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -699,6 +699,7 @@ static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 {
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 	struct drm_device *drm = crtc->dev;
+	int ret;
 
 	if (dc->event)
 		return -EBUSY;
@@ -706,7 +707,9 @@ static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	if (event) {
 		event->pipe = dc->pipe;
 		dc->event = event;
-		drm_vblank_get(drm, dc->pipe);
+		ret = drm_vblank_get(drm, dc->pipe);
+		if (ret < 0)
+			return ret;
 	}
 
 	tegra_dc_set_base(dc, 0, 0, fb);
-- 
2.1.2
