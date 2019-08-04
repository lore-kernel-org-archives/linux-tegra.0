From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/tegra: dc: Turn off and reset hardware across suspend-resume
Date: Sun,  4 Aug 2019 23:37:02 +0300
Message-ID: <20190804203702.16073-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The drivers core bumps runtime PM refcount during of entering into
suspend to workaround some problem where parent device may become turned
off before its children. For now CRTCs are only getting disabled on
suspend and in order to actually suspend the display controllers hardware,
the runtime PM needed to be "forced" into suspend mode.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4a75d149e368..6c8f5222d558 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2572,6 +2572,8 @@ static int tegra_dc_resume(struct device *dev)
 
 static const struct dev_pm_ops tegra_dc_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dc_suspend, tegra_dc_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_dc_driver = {
-- 
2.22.0
