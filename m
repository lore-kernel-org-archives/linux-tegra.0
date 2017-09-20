From: Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] phy: tegra: Handle return value of kasprintf
Date: Wed, 20 Sep 2017 12:35:57 +0530
Message-ID: <0a121b1761f0dc8fe9c5020e8d5c6dfd48c9a242.1505884381.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

kasprintf() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/phy/tegra/xusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 3cbcb25..4307bf0 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -454,6 +454,8 @@ struct tegra_xusb_lane *
 		char *name;
 
 		name = kasprintf(GFP_KERNEL, "%s-%u", type, index);
+		if (!name)
+			return ERR_PTR(-ENOMEM);
 		np = of_find_node_by_name(np, name);
 		kfree(name);
 	}
-- 
1.9.1
