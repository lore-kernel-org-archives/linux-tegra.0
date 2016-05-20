From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V7 2/3] soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
Date: Fri, 20 May 2016 20:15:29 +0530
Message-ID: <1463755530-20941-3-git-send-email-ldewangan@nvidia.com>
References: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, jonathanh@nvidia.com
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function tegra_pmc_readl() returns the u32 type data and hence
change the data type of variable where this data is stored to u32
type.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

---
Changes from V1:
-This is new in series as per discussion on V1 series to use u32 for
tegra_pmc_readl.

Changes from V2:
- Make unsigned long to u32 for some missed variable from V1.

Changes from V3:
- Revert back the value to ulong where time calcualtion is done.

Changes from V4:
- Collected RB from Jon.

Changes from V5/V6:
- None
---
 drivers/soc/tegra/pmc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2c3f1f9..09c2b97 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -875,10 +875,10 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
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
 
@@ -900,8 +900,9 @@ static void tegra_io_rail_unprepare(void)
 
 int tegra_io_rail_power_on(unsigned int id)
 {
-	unsigned long request, status, value;
-	unsigned int bit, mask;
+	unsigned long request, status;
+	unsigned int bit;
+	u32 value, mask;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -935,8 +936,9 @@ EXPORT_SYMBOL(tegra_io_rail_power_on);
 
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
