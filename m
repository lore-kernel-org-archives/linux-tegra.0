From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] gpu: host1x: Check whether size of unpin isn't 0
Date: Fri,  6 Jul 2018 21:02:36 +0300
Message-ID: <20180706180236.27896-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Only gather pins are mapped by the Host1x driver, regular BO relocations
are not. Check whether size of unpin isn't 0, otherwise IOVA allocation at
0x0 could be erroneously released.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/job.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index e2f4a4d93d20..527a1cddb14f 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -569,7 +569,8 @@ void host1x_job_unpin(struct host1x_job *job)
 	for (i = 0; i < job->num_unpins; i++) {
 		struct host1x_job_unpin_data *unpin = &job->unpins[i];
 
-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) &&
+		    unpin->size && host->domain) {
 			iommu_unmap(host->domain, job->addr_phys[i],
 				    unpin->size);
 			free_iova(&host->iova,
-- 
2.18.0
