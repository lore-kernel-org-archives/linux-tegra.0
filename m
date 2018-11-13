From: Bo Yan <byan@nvidia.com>
Subject: [PATCH] soc/tegra: remove duplicated function declaration
Date: Tue, 13 Nov 2018 09:51:05 -0800
Message-ID: <1542131465-22773-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Bo Yan <byan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function tegra_read_chipid is declared twice in fuse.h. Remove
the redundant declaration.

Signed-off-by: Bo Yan <byan@nvidia.com>
---
 include/soc/tegra/fuse.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 9b6ea0c..8fb2f8a 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -60,7 +60,6 @@ struct tegra_sku_info {
 
 u32 tegra_read_straps(void);
 u32 tegra_read_ram_code(void);
-u32 tegra_read_chipid(void);
 int tegra_fuse_readl(unsigned long offset, u32 *value);
 
 extern struct tegra_sku_info tegra_sku_info;
-- 
2.7.4
