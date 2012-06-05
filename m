From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 7/9] staging: nvec: add clk_prepare/clk_unprepare
Date: Tue, 5 Jun 2012 09:59:41 +0530
Message-ID: <1338870583-8704-8-git-send-email-pgaikwad@nvidia.com>
References: <1338870583-8704-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1338870583-8704-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use clk_prepare/clk_unprepare as required by the generic clk framework.

Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Please ignore previous versions. Updated commit message and
maintainers properly in this version. No other change.

This patch should go through Tegra tree since other patches to port Tegra
to generic clock framework are dependent on it. Posting here to get ack from
the maintainers.

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
