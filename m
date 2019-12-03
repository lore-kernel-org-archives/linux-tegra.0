From: Sumit Gupta <sumitg@nvidia.com>
Subject: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to get
 BPMP data
Date: Tue, 3 Dec 2019 23:02:26 +0530
Message-ID: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
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
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: sumitg@nvidia.com, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Adding new function of_tegra_bpmp_get() to get BPMP data.
This function can be used by other drivers like cpufreq to
get BPMP data without adding any property in respective
drivers DT node.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/bpmp.h      |  5 +++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 6741fcd..9c3d7f1 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -38,6 +38,44 @@ channel_to_ops(struct tegra_bpmp_channel *channel)
 	return bpmp->soc->ops;
 }
 
+struct tegra_bpmp *of_tegra_bpmp_get(void)
+{
+	struct platform_device *pdev;
+	struct device_node *bpmp_dev;
+	struct tegra_bpmp *bpmp;
+
+	/* Check for bpmp device status in DT */
+	bpmp_dev = of_find_compatible_node(NULL, NULL, "nvidia,tegra186-bpmp");
+	if (!bpmp_dev) {
+		bpmp = ERR_PTR(-ENODEV);
+		goto err_out;
+	}
+	if (!of_device_is_available(bpmp_dev)) {
+		bpmp = ERR_PTR(-ENODEV);
+		goto err_put;
+	}
+
+	pdev = of_find_device_by_node(bpmp_dev);
+	if (!pdev) {
+		bpmp = ERR_PTR(-ENODEV);
+		goto err_put;
+	}
+
+	bpmp = platform_get_drvdata(pdev);
+	if (!bpmp) {
+		bpmp = ERR_PTR(-EPROBE_DEFER);
+		put_device(&pdev->dev);
+		goto err_put;
+	}
+
+	return bpmp;
+err_put:
+	of_node_put(bpmp_dev);
+err_out:
+	return bpmp;
+}
+EXPORT_SYMBOL_GPL(of_tegra_bpmp_get);
+
 struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
 	struct platform_device *pdev;
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index f2604e9..21402d9 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -107,6 +107,7 @@ struct tegra_bpmp_message {
 };
 
 #if IS_ENABLED(CONFIG_TEGRA_BPMP)
+struct tegra_bpmp *of_tegra_bpmp_get(void);
 struct tegra_bpmp *tegra_bpmp_get(struct device *dev);
 void tegra_bpmp_put(struct tegra_bpmp *bpmp);
 int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
@@ -122,6 +123,10 @@ void tegra_bpmp_free_mrq(struct tegra_bpmp *bpmp, unsigned int mrq,
 			 void *data);
 bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int mrq);
 #else
+static inline struct tegra_bpmp *of_tegra_bpmp_get(void)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
 static inline struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
 	return ERR_PTR(-ENOTSUPP);
-- 
2.7.4
