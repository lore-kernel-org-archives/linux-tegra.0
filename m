From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 05/27] drivers/gpu/host1x/drm: don't check resource with devm_ioremap_resource
Date: Tue, 23 Jul 2013 20:01:38 +0200
Message-ID: <1374602524-3398-6-git-send-email-wsa@the-dreams.de>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Please apply via the subsystem-tree.

 drivers/gpu/host1x/drm/hdmi.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 01097da..9ffece6 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -1248,9 +1248,6 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 		return err;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs)
-		return -ENXIO;
-
 	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
-- 
1.7.10.4
