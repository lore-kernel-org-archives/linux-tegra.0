From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 07/17] clk: mvebu: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:39 +0000
Message-ID: <20191209195749.868-7-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, kgene@kernel.org, krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, dinguyen@kernel.org, mripard@kernel.org, wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net, kstewart@linuxfoundation.org, swinslow@gmail.com, aisheng.dong@nxp.com, robh@kernel.org, daniel.baluta@nxp.com, weiyongjun1@huawei.com, wangyan.wang@mediatek.com
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 4 +---
 drivers/clk/mvebu/armada-37xx-tbg.c    | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index f5746f9ea929..0d03878920ac 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -725,7 +725,6 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 	const struct clk_periph_data *data;
 	struct device *dev = &pdev->dev;
 	int num_periph = 0, i, ret;
-	struct resource *res;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
@@ -746,8 +745,7 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	driver_data->hw_data->num = num_periph;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	driver_data->reg = devm_ioremap_resource(dev, res);
+	driver_data->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(driver_data->reg))
 		return PTR_ERR(driver_data->reg);
 
diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index 585a02e0b330..5d86912fbb6e 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -84,7 +84,6 @@ static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *hw_tbg_data;
 	struct device *dev = &pdev->dev;
 	const char *parent_name;
-	struct resource *res;
 	struct clk *parent;
 	void __iomem *reg;
 	int i, ret;
@@ -105,8 +104,7 @@ static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
 	parent_name = __clk_get_name(parent);
 	clk_put(parent);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-- 
2.17.1
