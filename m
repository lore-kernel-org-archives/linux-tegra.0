From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V2 1/2] mailbox: tegra: hsp: add noirq resume
Date: Fri, 14 Jun 2019 09:31:00 -0700
Message-ID: <1560529861-31376-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add noirq resume instead of resume callback for Tegra HSP. Tegra HSP
resume needs tegra_hsp_doorbell_startup() call to fix timeout error for
tegra_bpmp_transfer() during genpd resume noirq on Jetson TX2.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 91f1a0c..91e223e 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -775,6 +775,12 @@ static int __maybe_unused tegra_hsp_resume(struct device *dev)
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
+	.resume_noirq = tegra_hsp_resume,
+};
 
 static const struct tegra_hsp_db_map tegra186_hsp_db_map[] = {
 	{ "ccplex", TEGRA_HSP_DB_MASTER_CCPLEX, HSP_DB_CCPLEX, },
-- 
2.7.4
