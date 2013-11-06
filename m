From: Duan Jiong <duanj.fnst@cn.fujitsu.com>
Subject: [PATCH] ethernet: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Wed, 6 Nov 2013 15:54:12 +0800
Message-ID: <1383724452-15428-1-git-send-email-duanj.fnst@cn.fujitsu.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kernel@pengutronix.de, linux@arm.linux.org.uk, a.zummo@towertech.it, airlied@linux.ie
Cc: linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Duan Jiong <duanj.fnst@cn.fujitsu.com>
List-Id: linux-tegra@vger.kernel.org

This patch fixes coccinelle error regarding usage of IS_ERR and
PTR_ERR instead of PTR_ERR_OR_ZERO.

Signed-off-by: Duan Jiong <duanj.fnst@cn.fujitsu.com>
---
 drivers/net/ethernet/8390/apne.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/8390/apne.c b/drivers/net/ethernet/8390/apne.c
index 912ed7a..e41e3af 100644
--- a/drivers/net/ethernet/8390/apne.c
+++ b/drivers/net/ethernet/8390/apne.c
@@ -551,9 +551,7 @@ static struct net_device *apne_dev;
 static int __init apne_module_init(void)
 {
 	apne_dev = apne_probe(-1);
-	if (IS_ERR(apne_dev))
-		return PTR_ERR(apne_dev);
-	return 0;
+	return PTR_ERR_OR_ZERO(apne_dev);
 }
 
 static void __exit apne_module_exit(void)
-- 
1.8.3.1
