From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 02/10] gpu: host1x: Print MLOCK state in debug dumps on T186
Date: Sun,  5 Nov 2017 13:01:10 +0200
Message-ID: <20171105110118.15142-3-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171105110118.15142-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add support for dumping current MLOCK state in debug dumps also
on T186, now that MLOCKs are used by the driver.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/debug_hw_1x06.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/hw/debug_hw_1x06.c b/drivers/gpu/host1x/hw/debug_hw_1x06.c
index b503c740c022..659dd6042ccc 100644
--- a/drivers/gpu/host1x/hw/debug_hw_1x06.c
+++ b/drivers/gpu/host1x/hw/debug_hw_1x06.c
@@ -131,5 +131,21 @@ static void host1x_debug_show_channel_fifo(struct host1x *host,
 
 static void host1x_debug_show_mlocks(struct host1x *host, struct output *o)
 {
-	/* TODO */
+	unsigned int i;
+
+	if (!host->hv_regs)
+		return;
+
+	host1x_debug_output(o, "---- mlocks ----\n");
+
+	for (i = 0; i < host1x_syncpt_nb_mlocks(host); i++) {
+		u32 val = host1x_hypervisor_readl(host, HOST1X_HV_MLOCK(i));
+		if (HOST1X_HV_MLOCK_LOCKED_V(val))
+			host1x_debug_output(o, "%u: locked by channel %u\n",
+					    i, HOST1X_HV_MLOCK_CH_V(val));
+		else
+			host1x_debug_output(o, "%u: unlocked\n", i);
+	}
+
+	host1x_debug_output(o, "\n");
 }
-- 
2.14.2
