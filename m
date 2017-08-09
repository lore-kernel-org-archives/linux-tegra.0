From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/4] phy: samsung: use of_device_get_match_data()
Date: Wed, 9 Aug 2017 17:17:58 +0800
Message-ID: <1502270280-13792-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1502270280-13792-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502270280-13792-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kamil Debski <kamil@wypas.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Baoyou Xie <baoyou.xie@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

reduce the boilerplate code to get the specific data

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/samsung/phy-exynos-dp-video.c |    5 ++---
 drivers/phy/samsung/phy-exynos5-usbdrd.c  |    7 ++++---
 drivers/phy/samsung/phy-samsung-usb2.c    |    9 +++------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos-dp-video.c b/drivers/phy/samsung/phy-exynos-dp-video.c
index bb3279d..2dd6dd1 100644
--- a/drivers/phy/samsung/phy-exynos-dp-video.c
+++ b/drivers/phy/samsung/phy-exynos-dp-video.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -78,7 +79,6 @@ static int exynos_dp_video_phy_probe(struct platform_device *pdev)
 {
 	struct exynos_dp_video_phy *state;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
 	struct phy_provider *phy_provider;
 	struct phy *phy;
 
@@ -93,8 +93,7 @@ static int exynos_dp_video_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(state->regs);
 	}
 
-	match = of_match_node(exynos_dp_video_phy_of_match, dev->of_node);
-	state->drvdata = match->data;
+	state->drvdata = of_device_get_match_data(dev);
 
 	phy = devm_phy_create(dev, NULL, &exynos_dp_video_phy_ops);
 	if (IS_ERR(phy)) {
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 7c41daa..22c68f5 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
@@ -662,7 +663,6 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	struct exynos5_usbdrd_phy *phy_drd;
 	struct phy_provider *phy_provider;
 	struct resource *res;
-	const struct of_device_id *match;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
 	struct regmap *reg_pmu;
 	u32 pmu_offset;
@@ -681,9 +681,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy_drd->reg_phy))
 		return PTR_ERR(phy_drd->reg_phy);
 
-	match = of_match_node(exynos5_usbdrd_phy_of_match, pdev->dev.of_node);
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
 
-	drv_data = match->data;
 	phy_drd->drv_data = drv_data;
 
 	ret = exynos5_usbdrd_phy_clk_handle(phy_drd);
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index 1d22d93..ea81886 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
@@ -142,7 +143,6 @@ static struct phy *samsung_usb2_phy_xlate(struct device *dev,
 
 static int samsung_usb2_phy_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	const struct samsung_usb2_phy_config *cfg;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
@@ -155,12 +155,9 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	match = of_match_node(samsung_usb2_phy_of_match, pdev->dev.of_node);
-	if (!match) {
-		dev_err(dev, "of_match_node() failed\n");
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
 		return -EINVAL;
-	}
-	cfg = match->data;
 
 	drv = devm_kzalloc(dev, sizeof(struct samsung_usb2_phy_driver) +
 		cfg->num_phys * sizeof(struct samsung_usb2_phy_instance),
-- 
1.7.9.5
