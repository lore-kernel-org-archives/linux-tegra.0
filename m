From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 06/17] clk: tegra: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:38 +0000
Message-ID: <20191209195749.868-6-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, kgene@kernel.org, krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, dinguyen@kernel.org, mripard@kernel.org, wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net, kstewart@linuxfoundation.org, swinslow@gmail.com, aisheng.dong
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/tegra/clk-dfll.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index c051d92c2bbf..070a2957e119 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1935,7 +1935,6 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
 int tegra_dfll_register(struct platform_device *pdev,
 			struct tegra_dfll_soc_data *soc)
 {
-	struct resource *mem;
 	struct tegra_dfll *td;
 	int ret;
 
@@ -1985,51 +1984,26 @@ int tegra_dfll_register(struct platform_device *pdev,
 		return ret;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(td->dev, "no control register resource\n");
-		return -ENODEV;
-	}
-
-	td->base = devm_ioremap(td->dev, mem->start, resource_size(mem));
+	td->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!td->base) {
 		dev_err(td->dev, "couldn't ioremap DFLL control registers\n");
 		return -ENODEV;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!mem) {
-		dev_err(td->dev, "no i2c_base resource\n");
-		return -ENODEV;
-	}
-
-	td->i2c_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
+	td->i2c_base = devm_platform_ioremap_resource(pdev, 1);
 	if (!td->i2c_base) {
 		dev_err(td->dev, "couldn't ioremap i2c_base resource\n");
 		return -ENODEV;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	if (!mem) {
-		dev_err(td->dev, "no i2c_controller_base resource\n");
-		return -ENODEV;
-	}
-
-	td->i2c_controller_base = devm_ioremap(td->dev, mem->start,
-					       resource_size(mem));
+	td->i2c_controller_base = devm_platform_ioremap_resource(pdev, 2);
 	if (!td->i2c_controller_base) {
 		dev_err(td->dev,
 			"couldn't ioremap i2c_controller_base resource\n");
 		return -ENODEV;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	if (!mem) {
-		dev_err(td->dev, "no lut_base resource\n");
-		return -ENODEV;
-	}
-
-	td->lut_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
+	td->lut_base = devm_platform_ioremap_resource(pdev, 3);
 	if (!td->lut_base) {
 		dev_err(td->dev,
 			"couldn't ioremap lut_base resource\n");
-- 
2.17.1
