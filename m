From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/4] media: staging: tegra-vde: Turn ON power domain on shutdown
Date: Wed, 24 Jun 2020 18:08:46 +0300
Message-ID: <20200624150847.22672-4-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On some devices bootloader isn't ready to a clamped VDE power, and thus,
machine hangs on a warm reboot (CPU reset). The VDE power partition is
turned ON by default on a cold boot, hence VDE driver should keep power
partition enabled on system's reboot too. This fixes hang on a warm reboot
on a Tegra20 Acer A500 device, which is handy if Embedded Controller
driver is unavailable, i.e. cold reboot can't be performed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 85cbbc8f70d3..b64e35b86fb4 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1085,9 +1085,17 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	pm_runtime_get_sync(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+	/*
+	 * Balance RPM state, the VDE power domain is left ON and hardware
+	 * is clock-gated. It's safe to reboot machine now.
+	 */
+	pm_runtime_put_noidle(dev);
+	clk_disable_unprepare(vde->clk);
+
 	misc_deregister(&vde->miscdev);
 
 	tegra_vde_dmabuf_cache_unmap_all(vde);
@@ -1099,6 +1107,16 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void tegra_vde_shutdown(struct platform_device *pdev)
+{
+	/*
+	 * On some devices bootloader isn't ready to a power-gated VDE on
+	 * a warm-reboot, machine will hang in that case.
+	 */
+	if (pm_runtime_status_suspended(&pdev->dev))
+		tegra_vde_runtime_resume(&pdev->dev);
+}
+
 static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
@@ -1144,6 +1162,7 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
 	.remove		= tegra_vde_remove,
+	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
 		.of_match_table = tegra_vde_of_match,
-- 
2.26.0
