From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 15/17] clk: bm1880: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:47 +0000
Message-ID: <20191209195749.868-15-tiny.windzz@gmail.com>
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
 drivers/clk/clk-bm1880.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 4cd175afce9b..9fa0ca1fe833 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -893,16 +893,13 @@ static int bm1880_clk_probe(struct platform_device *pdev)
 	struct bm1880_clock_data *clk_data;
 	void __iomem *pll_base, *sys_base;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int num_clks, i;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pll_base = devm_ioremap_resource(&pdev->dev, res);
+	pll_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pll_base))
 		return PTR_ERR(pll_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	sys_base = devm_ioremap_resource(&pdev->dev, res);
+	sys_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(sys_base))
 		return PTR_ERR(sys_base);
 
-- 
2.17.1
