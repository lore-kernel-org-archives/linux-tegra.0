From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 17/17] ARC: clk: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:49 +0000
Message-ID: <20191209195749.868-17-tiny.windzz@gmail.com>
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
 drivers/clk/clk-hsdk-pll.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index 97d1e8c35b71..155f2af65361 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -299,7 +299,6 @@ static const struct clk_ops hsdk_pll_ops = {
 static int hsdk_pll_clk_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct resource *mem;
 	const char *parent_name;
 	unsigned int num_parents;
 	struct hsdk_pll_clk *pll_clk;
@@ -310,8 +309,7 @@ static int hsdk_pll_clk_probe(struct platform_device *pdev)
 	if (!pll_clk)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pll_clk->regs = devm_ioremap_resource(dev, mem);
+	pll_clk->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pll_clk->regs))
 		return PTR_ERR(pll_clk->regs);
 
-- 
2.17.1
