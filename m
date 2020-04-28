From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 5/5] media: tegra-video: Remove module macros for vi and csi driver
Date: Mon, 27 Apr 2020 21:20:50 -0700
Message-ID: <1588047650-29402-6-git-send-email-skomatineni@nvidia.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl
Cc: digetx@gmail.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

tegra-video driver is a single module and module license macros
are in tegra-video driver and are not required in vi and csi driver.

So, this patch removes them.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 5 -----
 drivers/staging/media/tegra-video/vi.c  | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index eda6a42..2536ff5 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -7,7 +7,6 @@
 #include <linux/clk/tegra.h>
 #include <linux/device.h>
 #include <linux/host1x.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -535,7 +534,3 @@ struct platform_driver tegra_csi_driver = {
 	.probe			= tegra_csi_probe,
 	.remove			= tegra_csi_remove,
 };
-
-MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index bdf2560..397b6bc 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -9,7 +9,6 @@
 #include <linux/host1x.h>
 #include <linux/lcm.h>
 #include <linux/list.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -1081,7 +1080,3 @@ struct platform_driver tegra_vi_driver = {
 	.probe = tegra_vi_probe,
 	.remove = tegra_vi_remove,
 };
-
-MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
-MODULE_LICENSE("GPL v2");
-- 
2.7.4
