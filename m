From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] firmware: tegra: bpmp: Implement suspend/resume support
Date: Fri, 21 Sep 2018 12:08:56 +0200
Message-ID: <20180921100856.11396-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When returning from a system sleep state, the BPMP driver needs to
reinitialize the IVC channels used to communicate with the BPMP to
restore proper functionality.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 14a456afa379..41448ba78be9 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/semaphore.h>
 #include <linux/sched/clock.h>
 
@@ -843,6 +844,23 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	return err;
 }
 
+static int tegra_bpmp_resume(struct device *dev)
+{
+	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
+	unsigned int i;
+
+	/* reset message channels */
+	tegra_bpmp_channel_reset(bpmp->tx_channel);
+	tegra_bpmp_channel_reset(bpmp->rx_channel);
+
+	for (i = 0; i < bpmp->threaded.count; i++)
+		tegra_bpmp_channel_reset(&bpmp->threaded_channels[i]);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
+
 static const struct tegra_bpmp_soc tegra186_soc = {
 	.channels = {
 		.cpu_tx = {
@@ -871,6 +889,7 @@ static struct platform_driver tegra_bpmp_driver = {
 	.driver = {
 		.name = "tegra-bpmp",
 		.of_match_table = tegra_bpmp_match,
+		.pm = &tegra_bpmp_pm_ops,
 	},
 	.probe = tegra_bpmp_probe,
 };
-- 
2.19.0
