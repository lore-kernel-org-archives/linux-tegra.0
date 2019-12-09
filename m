From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 01/17] clk: sunxi: sunxi-ng: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:33 +0000
Message-ID: <20191209195749.868-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, kgene@kernel.org, krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, dinguyen@kernel.org, mripard@kernel.org, wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net, kstewart@linuxfoundation.org, swinslow@gmail.com, aisheng.dong
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c    | 4 +---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     | 4 +---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c    | 4 +---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c     | 4 +---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c     | 4 +---
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  | 4 +---
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c | 4 +---
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c     | 4 +---
 drivers/clk/sunxi/clk-mod0.c             | 4 +---
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c | 4 +---
 drivers/clk/sunxi/clk-sun6i-apb0.c       | 4 +---
 drivers/clk/sunxi/clk-sun6i-ar100.c      | 4 +---
 drivers/clk/sunxi/clk-sun8i-apb0.c       | 4 +---
 13 files changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 49bd7a4c015c..087880b20c15 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -923,12 +923,10 @@ static const struct sunxi_ccu_desc sun50i_a64_ccu_desc = {
 
 static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	void __iomem *reg;
 	u32 val;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index f2497d0a4683..00fa8ff2f51b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -1183,13 +1183,11 @@ static const u32 usb2_clk_regs[] = {
 
 static int sun50i_h6_ccu_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	void __iomem *reg;
 	u32 val;
 	int i;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 2b434521c5cc..b2aaa99ad23f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -887,12 +887,10 @@ static void sun8i_a83t_cpu_pll_fixup(void __iomem *reg)
 
 static int sun8i_a83t_ccu_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	void __iomem *reg;
 	u32 val;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index d9668493c3f9..f48f61297551 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -251,7 +251,6 @@ static const struct sunxi_ccu_desc sun8i_v3s_de2_clk_desc = {
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct clk *bus_clk, *mod_clk;
 	struct reset_control *rstc;
 	void __iomem *reg;
@@ -262,8 +261,7 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	if (!ccu_desc)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 897490800102..b456f85fd8da 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1294,14 +1294,12 @@ static struct regmap_config sun8i_r40_ccu_regmap_config = {
 
 static int sun8i_r40_ccu_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct regmap *regmap;
 	void __iomem *reg;
 	u32 val;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
index 6616e8114f62..94552199d54d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
@@ -203,14 +203,12 @@ static const struct sunxi_ccu_desc sun9i_a80_de_clk_desc = {
 
 static int sun9i_a80_de_clk_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct clk *bus_clk;
 	struct reset_control *rstc;
 	void __iomem *reg;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
index 4b4a507d04ed..adac159a5f63 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
@@ -92,13 +92,11 @@ static const struct sunxi_ccu_desc sun9i_a80_usb_clk_desc = {
 
 static int sun9i_a80_usb_clk_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct clk *bus_clk;
 	void __iomem *reg;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
index dcac1391767f..8295667e2252 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -1213,12 +1213,10 @@ static void sun9i_a80_cpu_pll_fixup(void __iomem *reg)
 
 static int sun9i_a80_ccu_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	void __iomem *reg;
 	u32 val;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index 0cca91e075a5..cdb98937f584 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -88,14 +88,12 @@ CLK_OF_DECLARE_DRIVER(sun4i_a10_mod0, "allwinner,sun4i-a10-mod0-clk",
 static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *r;
 	void __iomem *reg;
 
 	if (!np)
 		return -ENODEV;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, r);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
index a165e7172346..abae2813c59e 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
@@ -41,7 +41,6 @@ static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
 	const struct gates_data *data;
 	const char *clk_parent;
 	const char *clk_name;
-	struct resource *r;
 	void __iomem *reg;
 	int ngates;
 	int i;
@@ -55,8 +54,7 @@ static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
 		return -ENODEV;
 	data = device->data;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, r);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi/clk-sun6i-apb0.c b/drivers/clk/sunxi/clk-sun6i-apb0.c
index 10f70c35c265..f80c67bafe38 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0.c
@@ -32,12 +32,10 @@ static int sun6i_a31_apb0_clk_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	const char *clk_name = np->name;
 	const char *clk_parent;
-	struct resource *r;
 	void __iomem *reg;
 	struct clk *clk;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, r);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
index e1b7d0929cf7..ffc297732f8f 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -71,12 +71,10 @@ static DEFINE_SPINLOCK(sun6i_ar100_lock);
 static int sun6i_a31_ar100_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *r;
 	void __iomem *reg;
 	struct clk *clk;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, r);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-sun8i-apb0.c
index fc5d6e3b77d1..f605ecca879f 100644
--- a/drivers/clk/sunxi/clk-sun8i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
@@ -87,12 +87,10 @@ CLK_OF_DECLARE_DRIVER(sun8i_a23_apb0, "allwinner,sun8i-a23-apb0-clk",
 static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *r;
 	void __iomem *reg;
 	struct clk *clk;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(&pdev->dev, r);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-- 
2.17.1
