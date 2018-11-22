From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] soc/tegra: optimize soc_is_tegra()
Date: Thu, 22 Nov 2018 11:42:13 -0500
Message-ID: <20181122164213.26101-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use for() to rewrite the code.In addition,match->compatible[0]
is equal to *match->compatible,change it.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 54627ca957e8..521a201d9fff 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -24,11 +24,9 @@ bool soc_is_tegra(void)
 {
 	const struct of_device_id *match = tegra_machine_match;
 
-	while (match->compatible[0]) {
+	for (; *match->compatible; match++) {
 		if (of_machine_is_compatible(match->compatible))
 			return true;
-
-		match++;
 	}
 
 	return false;
-- 
2.17.0
