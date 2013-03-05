From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] drm/tegra: drop "select DRM_HDMI"
Date: Tue, 05 Mar 2013 22:07:36 +0100
Message-ID: <1362517656.16460.125.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit ac24c2204a76e5b42aa103bf963ae0eda1b827f3 ("drm/tegra: Use generic
HDMI infoframe helpers") added "select DRM_HDMI" to the DRM_TEGRA
Kconfig entry. But there is no Kconfig symbol named DRM_HDMI. The select
statement for that symbol is a nop. Drop it.

What was needed to use HDMI functionality was to select HDMI (which this
entry already did through depending on DRM) and to include linux/hdmi.h
(which this commit also did).

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested. 

 drivers/gpu/drm/tegra/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index c92955d..be1daf7 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -4,7 +4,6 @@ config DRM_TEGRA
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_CMA_HELPER
-	select DRM_HDMI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
1.7.11.7
