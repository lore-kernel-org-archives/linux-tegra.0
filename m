From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 03/17] clk: samsung: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:35 +0000
Message-ID: <20191209195749.868-3-tiny.windzz@gmail.com>
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
 drivers/clk/samsung/clk-exynos-audss.c   | 4 +---
 drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 42b5d32c6cc7..9cc127a162ad 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -129,7 +129,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
 	const struct exynos_audss_clk_drvdata *variant;
 	struct clk_hw **clk_table;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	int i, ret = 0;
 
@@ -137,8 +136,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 4b9e73608c21..20f5129f7212 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -110,11 +110,9 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 	struct samsung_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	void __iomem *reg_base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base)) {
 		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(reg_base);
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 4b1aa9382ad2..b0d48cddfd6e 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5557,7 +5557,6 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	struct exynos5433_cmu_data *data;
 	struct samsung_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *reg_base;
 	int i;
 
@@ -5570,8 +5569,7 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	ctx = &data->ctx;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index 14985ebd043b..503bd8a10d8f 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -63,15 +63,13 @@ static struct syscore_ops s5pv210_audss_clk_syscore_ops = {
 static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 {
 	int i, ret = 0;
-	struct resource *res;
 	const char *mout_audss_p[2];
 	const char *mout_i2s_p[3];
 	const char *hclk_p;
 	struct clk_hw **clk_table;
 	struct clk *hclk, *pll_ref, *pll_in, *cdclk, *sclk_audio;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(&pdev->dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base)) {
 		dev_err(&pdev->dev, "failed to map audss registers\n");
 		return PTR_ERR(reg_base);
-- 
2.17.1
