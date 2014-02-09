From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] drm/tegra: fix typo 'CONFIG_TEGRA_DRM_FBDEV'
Date: Sun, 09 Feb 2014 14:01:33 +0100
Message-ID: <1391950893.20670.2.camel@x220>
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
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Thierry Reding <thierry.reding@gmail.com>, Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Entirely untested. But it's clear that this is what was intended.

 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 88a5290..c715947 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -104,7 +104,7 @@ static void tegra_drm_context_free(struct tegra_drm_context *context)
 
 static void tegra_drm_lastclose(struct drm_device *drm)
 {
-#ifdef CONFIG_TEGRA_DRM_FBDEV
+#ifdef CONFIG_DRM_TEGRA_FBDEV
 	struct tegra_drm *tegra = drm->dev_private;
 
 	tegra_fbdev_restore_mode(tegra->fbdev);
-- 
1.8.5.3
