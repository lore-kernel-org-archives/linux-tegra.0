From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 2/4] soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
Date: Wed, 4 May 2016 17:09:31 +0530
Message-ID: <1462361973-27990-3-git-send-email-ldewangan@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, airlied@linux.ie
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function tegra_pmc_readl() returns the u32 type data and hence
change the data type of variable where this data is stored to u32
type.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
-This is new in series as per discussion on V1 series to use u32 for
tegra_pmc_readl.

Changes from V2:
- Make unsigned long to u32 for some missed variable from V1.
---
 drivers/soc/tegra/pmc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2c3f1f9..eff9425 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -844,7 +844,8 @@ static void tegra_powergate_init(struct tegra_pmc *pmc)
 static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 				 unsigned long *status, unsigned int *bit)
 {
-	unsigned long rate, value;
+	unsigned long rate;
+	u32 value;
 
 	*bit = id % 32;
 
@@ -868,17 +869,18 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 	tegra_pmc_writel(DPD_SAMPLE_ENABLE, DPD_SAMPLE);
 
 	/* must be at least 200 ns, in APB (PCLK) clock cycles */
-	value = DIV_ROUND_UP(1000000000, rate);
-	value = DIV_ROUND_UP(200, value);
+	rate = DIV_ROUND_UP(1000000000, rate);
+	rate = DIV_ROUND_UP(200, rate);
+	value = (u32)rate;
 	tegra_pmc_writel(value, SEL_DPD_TIM);
 
 	return 0;
 }
 
-static int tegra_io_rail_poll(unsigned long offset, unsigned long mask,
-			      unsigned long val, unsigned long timeout)
+static int tegra_io_rail_poll(unsigned long offset, u32 mask,
+			      u32 val, unsigned long timeout)
 {
-	unsigned long value;
+	u32 value;
 
 	timeout = jiffies + msecs_to_jiffies(timeout);
 
@@ -900,8 +902,9 @@ static void tegra_io_rail_unprepare(void)
 
 int tegra_io_rail_power_on(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
+	u32 value, mask;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -935,8 +938,9 @@ EXPORT_SYMBOL(tegra_io_rail_power_on);
 
 int tegra_io_rail_power_off(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
+	u32 value, mask;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
-- 
2.1.4
