From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy for a long time
Date: Tue, 24 Mar 2020 22:12:16 +0300
Message-ID: <20200324191217.1829-2-digetx@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20200324191217.1829-1-digetx@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Boot CPU0 always handle I2C interrupt and under some rare circumstances
(like running KASAN + NFS root) it may stuck in uninterruptible state for
a significant time. In this case we will get timeout if I2C transfer is
running on a sibling CPU, despite of IRQ being raised. In order to handle
this rare condition, the IRQ status needs to be checked after completion
timeout.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cbc2ad49043e..0daa863fb26f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1000,14 +1000,13 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 	do {
 		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
-		if (status) {
+		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
 
-			if (completion_done(complete)) {
-				s64 delta = ktime_ms_delta(ktimeout, ktime);
+		if (completion_done(complete)) {
+			s64 delta = ktime_ms_delta(ktimeout, ktime);
 
-				return msecs_to_jiffies(delta) ?: 1;
-			}
+			return msecs_to_jiffies(delta) ?: 1;
 		}
 
 		ktime = ktime_get();
@@ -1034,14 +1033,18 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		disable_irq(i2c_dev->irq);
 
 		/*
-		 * There is a chance that completion may happen after IRQ
-		 * synchronization, which is done by disable_irq().
+		 * Under some rare circumstances (like running KASAN +
+		 * NFS root) CPU, which handles interrupt, may stuck in
+		 * uninterruptible state for a significant time.  In this
+		 * case we will get timeout if I2C transfer is running on
+		 * a sibling CPU, despite of IRQ being raised.
+		 *
+		 * In order to handle this rare condition, the IRQ status
+		 * needs to be checked after timeout.
 		 */
-		if (ret == 0 && completion_done(complete)) {
-			dev_warn(i2c_dev->dev,
-				 "completion done after timeout\n");
-			ret = 1;
-		}
+		if (ret == 0)
+			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
+								complete, 0);
 	}
 
 	return ret;
-- 
2.25.1
