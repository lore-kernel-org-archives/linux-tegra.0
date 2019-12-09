From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 10/17] clk: axi-clkgen: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:42 +0000
Message-ID: <20191209195749.868-10-tiny.windzz@gmail.com>
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
 drivers/clk/clk-axi-clkgen.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 96f351785b41..8d0c32e81e78 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -412,7 +412,6 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	struct clk_init_data init;
 	const char *parent_names[2];
 	const char *clk_name;
-	struct resource *mem;
 	unsigned int i;
 	int ret;
 
@@ -427,8 +426,7 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (!axi_clkgen)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	axi_clkgen->base = devm_ioremap_resource(&pdev->dev, mem);
+	axi_clkgen->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(axi_clkgen->base))
 		return PTR_ERR(axi_clkgen->base);
 
-- 
2.17.1
