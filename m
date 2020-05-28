From: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH] usb: phy: tegra: Fix unnecessary check in tegra_usb_phy_probe()
Date: Thu, 28 May 2020 19:47:17 +0800
Message-ID: <20200528114717.21028-1-tangbin@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>, Zhang Shengju <zhangshengju-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In the function tegra_usb_phy_probe(), if usb_add_phy_dev() failed,
the return value will be given to err, and if usb_add_phy_dev() succeed,
the return value will be zero. Thus it is unnecessary to repeated check
here.

Signed-off-by: Zhang Shengju <zhangshengju-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index c294dc617..27c2e9843 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1200,11 +1200,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tegra_phy);
 
-	err = usb_add_phy_dev(&tegra_phy->u_phy);
-	if (err)
-		return err;
-
-	return 0;
+	return usb_add_phy_dev(&tegra_phy->u_phy);
 }
 
 static int tegra_usb_phy_remove(struct platform_device *pdev)
-- 
2.20.1.windows.1
