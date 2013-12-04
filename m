From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: [PATCH 7/7] usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
Date: Wed,  4 Dec 2013 10:00:35 +0800
Message-ID: <1386122435-4205-1-git-send-email-chris.ruehl@gtsys.com.hk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: gregkh@linuxfoundation.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Ruehl <chris.ruehl@gtsys.com.hk>
List-Id: linux-tegra@vger.kernel.org

usb: phy-tegra-usb.c: wrong pointer check for remap UTMI

A wrong pointer was used to test the result of devm_ioremap()

Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Acked-by: Venu Byravarasu <vbyravarasu@nvidia.com>
---
 drivers/usb/phy/phy-tegra-usb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 82232ac..bbe4f8e 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -876,7 +876,7 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 
 	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
 		resource_size(res));
-	if (!tegra_phy->regs) {
+	if (!tegra_phy->pad_regs) {
 		dev_err(&pdev->dev, "Failed to remap UTMI Pad regs\n");
 		return -ENOMEM;
 	}
-- 
1.7.10.4
