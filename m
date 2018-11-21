From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] soc/tegra: refactor soc_is_tegra()
Date: Wed, 21 Nov 2018 09:12:04 -0500
Message-ID: <20181121141204.22819-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

of_find_node_by_path() acquires a reference to the node returned by
it and that reference needs to be dropped by its caller.soc_is_tegra()
doesn't do that, so fix it.Call of_machine_is_compatible() to refactor
soc_is_tegra() whcih automatically manages the reference count.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/tegra/common.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd8f41351add..0b40700b672a 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -22,11 +22,13 @@ static const struct of_device_id tegra_machine_match[] = {
 
 bool soc_is_tegra(void)
 {
-	struct device_node *root;
+	struct of_device_id *match = tegra_machine_match;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return false;
+	while(match->compatible){
+		if(of_machine_is_compatible(match->compatible))
+			return true;
+		match++;
+	}
 
-	return of_match_node(tegra_machine_match, root) != NULL;
+	return false;
 }
-- 
2.17.0
