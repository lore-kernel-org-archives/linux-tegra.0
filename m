From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/14] staging: media: tegra-vde: Support BSEV clock and reset
Date: Mon, 13 Aug 2018 16:50:14 +0200
Message-ID: <20180813145027.16346-2-thierry.reding@gmail.com>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The BSEV clock has a separate gate bit and can not be assumed to be
always enabled. Add explicit handling for the BSEV clock and reset.

This fixes an issue on Tegra124 where the BSEV clock is not enabled
by default and therefore accessing the BSEV registers will hang the
CPU if the BSEV clock is not enabled and the reset not deasserted.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 35 +++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index 6f06061a40d9..9d8f833744db 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -74,9 +74,11 @@ struct tegra_vde {
 	struct miscdevice miscdev;
 	struct reset_control *rst;
 	struct reset_control *rst_mc;
+	struct reset_control *rst_bsev;
 	struct gen_pool *iram_pool;
 	struct completion decode_completion;
 	struct clk *clk;
+	struct clk *clk_bsev;
 	dma_addr_t iram_lists_addr;
 	u32 *iram;
 };
@@ -979,6 +981,11 @@ static int tegra_vde_runtime_suspend(struct device *dev)
 		return err;
 	}
 
+	reset_control_assert(vde->rst_bsev);
+
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(vde->clk_bsev);
 	clk_disable_unprepare(vde->clk);
 
 	return 0;
@@ -996,6 +1003,16 @@ static int tegra_vde_runtime_resume(struct device *dev)
 		return err;
 	}
 
+	err = clk_prepare_enable(vde->clk_bsev);
+	if (err < 0)
+		return err;
+
+	err = reset_control_deassert(vde->rst_bsev);
+	if (err < 0)
+		return err;
+
+	usleep_range(2000, 4000);
+
 	return 0;
 }
 
@@ -1084,14 +1101,21 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	if (IS_ERR(vde->frameid))
 		return PTR_ERR(vde->frameid);
 
-	vde->clk = devm_clk_get(dev, NULL);
+	vde->clk = devm_clk_get(dev, "vde");
 	if (IS_ERR(vde->clk)) {
 		err = PTR_ERR(vde->clk);
 		dev_err(dev, "Could not get VDE clk %d\n", err);
 		return err;
 	}
 
-	vde->rst = devm_reset_control_get(dev, NULL);
+	vde->clk_bsev = devm_clk_get(dev, "bsev");
+	if (IS_ERR(vde->clk_bsev)) {
+		err = PTR_ERR(vde->clk_bsev);
+		dev_err(dev, "failed to get BSEV clock: %d\n", err);
+		return err;
+	}
+
+	vde->rst = devm_reset_control_get(dev, "vde");
 	if (IS_ERR(vde->rst)) {
 		err = PTR_ERR(vde->rst);
 		dev_err(dev, "Could not get VDE reset %d\n", err);
@@ -1105,6 +1129,13 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	vde->rst_bsev = devm_reset_control_get(dev, "bsev");
+	if (IS_ERR(vde->rst_bsev)) {
+		err = PTR_ERR(vde->rst_bsev);
+		dev_err(dev, "failed to get BSEV reset: %d\n", err);
+		return err;
+	}
+
 	irq = platform_get_irq_byname(pdev, "sync-token");
 	if (irq < 0)
 		return irq;
-- 
2.17.0
