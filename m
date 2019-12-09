From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 05/17] clk: hisilicon: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:37 +0000
Message-ID: <20191209195749.868-5-tiny.windzz@gmail.com>
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
 drivers/clk/hisilicon/clk-hi3660-stub.c | 6 +-----
 drivers/clk/hisilicon/clk.c             | 7 +------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 3a653d54bee0..7e44d6e2a307 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -124,7 +124,6 @@ static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,
 static int hi3660_stub_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 
@@ -139,10 +138,7 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(stub_clk_chan.mbox))
 		return PTR_ERR(stub_clk_chan.mbox);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
+	freq_reg = devm_platform_ioremap_resource(pdev, 0);
 	if (!freq_reg)
 		return -ENOMEM;
 
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 54d9fdc93599..8c521495d9e5 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -27,18 +27,13 @@ struct hisi_clock_data *hisi_clk_alloc(struct platform_device *pdev,
 						int nr_clks)
 {
 	struct hisi_clock_data *clk_data;
-	struct resource *res;
 	struct clk **clk_table;
 
 	clk_data = devm_kmalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
 		return NULL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return NULL;
-	clk_data->base = devm_ioremap(&pdev->dev,
-				res->start, resource_size(res));
+	clk_data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!clk_data->base)
 		return NULL;
 
-- 
2.17.1
