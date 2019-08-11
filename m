From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2] drm/tegra: Turn off and reset hardware across suspend-resume
Date: Sun, 11 Aug 2019 21:39:32 +0300
Message-ID: <20190811183932.15850-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The drivers core bumps runtime PM refcount during of entering into
suspend to workaround some problem where parent device may become turned
off before its children. In order to disable and reset CRTCs/HDMI/etc
hardware, the runtime PM needs to be "forced" into suspend mode.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: The SYSTEM_SLEEP_PM_OPS are now set for all of the relevant drivers and
    not only for the DC because turned out that they all should enforce the
    suspending.

 drivers/gpu/drm/tegra/dc.c    | 2 ++
 drivers/gpu/drm/tegra/dpaux.c | 2 ++
 drivers/gpu/drm/tegra/dsi.c   | 2 ++
 drivers/gpu/drm/tegra/hdmi.c  | 2 ++
 drivers/gpu/drm/tegra/hub.c   | 2 ++
 drivers/gpu/drm/tegra/sor.c   | 2 ++
 drivers/gpu/drm/tegra/vic.c   | 2 ++
 7 files changed, 14 insertions(+)

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
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 2d94da225e51..22f80f69ffb8 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -638,6 +638,8 @@ static int tegra_dpaux_resume(struct device *dev)
 
 static const struct dev_pm_ops tegra_dpaux_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dpaux_suspend, tegra_dpaux_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra_dpaux_of_match[] = {
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 2fbfefe9cb42..fd0f8cec8c7e 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1665,6 +1665,8 @@ static int tegra_dsi_resume(struct device *dev)
 
 static const struct dev_pm_ops tegra_dsi_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dsi_suspend, tegra_dsi_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra_dsi_of_match[] = {
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 334c4d7d238b..ef66defac767 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1739,6 +1739,8 @@ static int tegra_hdmi_resume(struct device *dev)
 
 static const struct dev_pm_ops tegra_hdmi_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_hdmi_suspend, tegra_hdmi_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_hdmi_driver = {
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 92f202ec0577..3d33d0360169 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -931,6 +931,8 @@ static int __maybe_unused tegra_display_hub_resume(struct device *dev)
 static const struct dev_pm_ops tegra_display_hub_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_display_hub_suspend,
 			   tegra_display_hub_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct tegra_display_hub_soc tegra186_display_hub = {
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4ffe3794e6d3..b743193bf0b1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3572,6 +3572,8 @@ static int tegra_sor_resume(struct device *dev)
 
 static const struct dev_pm_ops tegra_sor_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_sor_suspend, tegra_sor_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_sor_driver = {
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 958548ef69e7..880304a65c5c 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -476,6 +476,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.22.0
