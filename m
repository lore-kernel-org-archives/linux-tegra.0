From: Prashant Gaikwad <pgaikwad@nvidia.com>
Subject: [PATCH 7/9] staging: nvec: add clk_prepare/clk_unprepare
Date: Fri, 1 Jun 2012 14:42:46 +0530
Message-ID: <1338541968-7961-8-git-send-email-pgaikwad@nvidia.com>
References: <1338541968-7961-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1338541968-7961-1-git-send-email-pgaikwad@nvidia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: swarren@nvidia.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, Prashant Gaikwad <pgaikwad@nvidia.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, olof@lixom.net, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Use clk_prepare/clk_unprepare as required by the generic clk framework.

This patch should go through Tegra tree since other patches to port Tegra
to generic clock framework are dependent on it. Posting here to get ack from
the maintainers.

Signed-off-by: Prashant Gaikwad <pgaikwad@nvidia.com>
---
 drivers/staging/nvec/nvec.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 3c60088..9356886 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -675,7 +675,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
 {
 	u32 val;
 
-	clk_enable(nvec->i2c_clk);
+	clk_prepare_enable(nvec->i2c_clk);
 
 	tegra_periph_reset_assert(nvec->i2c_clk);
 	udelay(2);
@@ -695,14 +695,14 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
 
 	enable_irq(nvec->irq);
 
-	clk_disable(nvec->i2c_clk);
+	clk_disable_unprepare(nvec->i2c_clk);
 }
 
 static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
 	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
-	clk_disable(nvec->i2c_clk);
+	clk_disable_unprepare(nvec->i2c_clk);
 }
 
 static void nvec_power_off(void)
@@ -812,7 +812,7 @@ static int __devinit tegra_nvec_probe(struct platform_device *pdev)
 
 	tegra_init_i2c_slave(nvec);
 
-	clk_enable(i2c_clk);
+	clk_prepare_enable(i2c_clk);
 
 
 	/* enable event reporting */
-- 
1.7.4.1
