From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] amba: tegra-ahb: mark PM functions as __maybe_unused
Date: Fri, 26 Apr 2019 16:56:03 +0200
Message-ID: <20190426145617.2342824-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

clang warns about an unused variable when CONFIG_PM is disabled,
since it is only referenced from an #ifdef:

drivers/amba/tegra-ahb.c:97:18: error: variable 'tegra_ahb_gizmo' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]

Rather than trying to get the #ifdef right, remove it and
use __maybe_unused here, which is less error prone.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/amba/tegra-ahb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index b0b688c481e8..3751d811be39 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -170,8 +170,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
 EXPORT_SYMBOL(tegra_ahb_enable_smmu);
 #endif
 
-#ifdef CONFIG_PM
-static int tegra_ahb_suspend(struct device *dev)
+static int __maybe_unused tegra_ahb_suspend(struct device *dev)
 {
 	int i;
 	struct tegra_ahb *ahb = dev_get_drvdata(dev);
@@ -181,7 +180,7 @@ static int tegra_ahb_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_ahb_resume(struct device *dev)
+static int __maybe_unused tegra_ahb_resume(struct device *dev)
 {
 	int i;
 	struct tegra_ahb *ahb = dev_get_drvdata(dev);
@@ -190,7 +189,6 @@ static int tegra_ahb_resume(struct device *dev)
 		gizmo_writel(ahb, ahb->ctx[i], tegra_ahb_gizmo[i]);
 	return 0;
 }
-#endif
 
 static UNIVERSAL_DEV_PM_OPS(tegra_ahb_pm,
 			    tegra_ahb_suspend,
-- 
2.20.0
