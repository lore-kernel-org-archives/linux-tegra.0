From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/6] soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
Date: Mon, 2 May 2016 17:47:10 +0530
Message-ID: <1462191434-28933-3-git-send-email-ldewangan@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function tegra_pmc_readl() returns the u32 type data and hence
change the data type of variable where this data is stored to u32
type.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
-This is new in series as per discussion on V1 series to use u32 for
tegra_pmc_readl.
---
 drivers/soc/tegra/pmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2c3f1f9..fc4f7b2 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -878,7 +878,7 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 static int tegra_io_rail_poll(unsigned long offset, unsigned long mask,
 			      unsigned long val, unsigned long timeout)
 {
-	unsigned long value;
+	u32 value;
 
 	timeout = jiffies + msecs_to_jiffies(timeout);
 
@@ -900,8 +900,9 @@ static void tegra_io_rail_unprepare(void)
 
 int tegra_io_rail_power_on(unsigned int id)
 {
-	unsigned long request, status, value;
+	unsigned long request, status;
 	unsigned int bit, mask;
+	u32 value;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
@@ -935,8 +936,9 @@ EXPORT_SYMBOL(tegra_io_rail_power_on);
 
 int tegra_io_rail_power_off(unsigned int id)
 {
-	unsigned long request, status, value;
+	unsigned long request, status;
 	unsigned int bit, mask;
+	u32 value;
 	int err;
 
 	mutex_lock(&pmc->powergates_lock);
-- 
2.1.4
