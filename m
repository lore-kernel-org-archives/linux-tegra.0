From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 29/37] memory: tegra20-emc: Use devm_platform_ioremap_resource
Date: Tue,  9 Jun 2020 16:13:56 +0300
Message-ID: <20200609131404.17523-30-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 2e310c51c599..507065c2f452 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -689,7 +689,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	int irq, err;
 
 	/* driver has nothing to do in a case of memory timing absence */
@@ -724,8 +723,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.26.0
