From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: tegra: Delete two error messages for a failed memory
 allocation in tegra_pinctrl_probe()
Date: Thu, 28 Dec 2017 15:32:31 +0100
Message-ID: <0a67035f-e089-85f6-adff-14e41c957ab6@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 15:15:08 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 51716819129d..72c718e66ebb 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -666,10 +666,9 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	int fn, gn, gfn;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
-	if (!pmx) {
-		dev_err(&pdev->dev, "Can't alloc tegra_pmx\n");
+	if (!pmx)
 		return -ENOMEM;
-	}
+
 	pmx->dev = &pdev->dev;
 	pmx->soc = soc_data;
 
@@ -722,10 +721,8 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	pmx->regs = devm_kzalloc(&pdev->dev, pmx->nbanks * sizeof(*pmx->regs),
 				 GFP_KERNEL);
-	if (!pmx->regs) {
-		dev_err(&pdev->dev, "Can't alloc regs pointer\n");
+	if (!pmx->regs)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-- 
2.15.1

