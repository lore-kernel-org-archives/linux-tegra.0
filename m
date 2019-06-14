From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 2/2] mailbox: tegra: avoid resume NULL mailboxes
Date: Fri, 14 Jun 2019 05:35:34 -0700
Message-ID: <1560515734-2085-2-git-send-email-bbiswas@nvidia.com>
References: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If Tegra hsp device tree does not have 'shared irqs',
mailboxes pointer is NULL. Add non-NULL HSP mailboxes
check in resume callback before tegra_hsp_mailbox_startup()
call and prevent NULL pointer exception.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index f147374..a11fb1c 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -782,11 +782,13 @@ static int __maybe_unused tegra_hsp_noirq_resume(struct device *dev)
 			tegra_hsp_doorbell_startup(db->channel.chan);
 	}
 
-	for (i = 0; i < hsp->num_sm; i++) {
-		struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
+	if (hsp->mailboxes) {
+		for (i = 0; i < hsp->num_sm; i++) {
+			struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
 
-		if (mb->channel.chan->cl)
-			tegra_hsp_mailbox_startup(mb->channel.chan);
+			if (mb->channel.chan->cl)
+				tegra_hsp_mailbox_startup(mb->channel.chan);
+		}
 	}
 
 	return 0;
-- 
2.7.4
