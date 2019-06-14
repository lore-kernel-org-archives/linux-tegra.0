From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 1/2] mailbox: tegra: hsp: add noirq resume
Date: Fri, 14 Jun 2019 05:35:33 -0700
Message-ID: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add noirq resume instead of resume callback for Tegra HSP. Tegra HSP
resume needs tegra_hsp_doorbell_startup() call to fix timeout error for
tegra_bpmp_transfer() during genpd resume noirq on jetson-tx2.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 91f1a0c..f147374 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -771,10 +771,16 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused tegra_hsp_resume(struct device *dev)
+static int __maybe_unused tegra_hsp_noirq_resume(struct device *dev)
 {
 	struct tegra_hsp *hsp = dev_get_drvdata(dev);
 	unsigned int i;
+	struct tegra_hsp_doorbell *db;
+
+	list_for_each_entry(db, &hsp->doorbells, list) {
+		if (db && db->channel.chan)
+			tegra_hsp_doorbell_startup(db->channel.chan);
+	}
 
 	for (i = 0; i < hsp->num_sm; i++) {
 		struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
@@ -786,7 +792,9 @@ static int __maybe_unused tegra_hsp_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tegra_hsp_pm_ops, NULL, tegra_hsp_resume);
+static const struct dev_pm_ops tegra_hsp_pm_ops = {
+	.resume_noirq   = tegra_hsp_noirq_resume,
+};
 
 static const struct tegra_hsp_db_map tegra186_hsp_db_map[] = {
 	{ "ccplex", TEGRA_HSP_DB_MASTER_CCPLEX, HSP_DB_CCPLEX, },
-- 
2.7.4
