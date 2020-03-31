From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 3/3] soc/tegra: fuse: Trivial clean-up of tegra_init_revision()
Date: Tue, 31 Mar 2020 11:33:41 +0100
Message-ID: <20200331103341.19571-3-jonathanh@nvidia.com>
References: <20200331103341.19571-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200331103341.19571-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Clean-up the tegra_init_revision() function by removing the 'rev'
variable which is not needed and use the newly added helper function
tegra_get_minor_rev() to get the minor revision.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 08a2522bd4de..5b1238c2b187 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -75,36 +75,32 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 
 void __init tegra_init_revision(void)
 {
-	u32 id, chip_id, minor_rev;
-	int rev;
+	u8 chip_id, minor_rev;
 
-	id = tegra_read_chipid();
-	chip_id = (id >> 8) & 0xff;
-	minor_rev = (id >> 16) & 0xf;
+	chip_id = tegra_get_chip_id();
+	minor_rev = tegra_get_minor_rev();
 
 	switch (minor_rev) {
 	case 1:
-		rev = TEGRA_REVISION_A01;
+		tegra_sku_info.revision = TEGRA_REVISION_A01;
 		break;
 	case 2:
-		rev = TEGRA_REVISION_A02;
+		tegra_sku_info.revision = TEGRA_REVISION_A02;
 		break;
 	case 3:
 		if (chip_id == TEGRA20 && (tegra_fuse_read_spare(18) ||
 					   tegra_fuse_read_spare(19)))
-			rev = TEGRA_REVISION_A03p;
+			tegra_sku_info.revision = TEGRA_REVISION_A03p;
 		else
-			rev = TEGRA_REVISION_A03;
+			tegra_sku_info.revision = TEGRA_REVISION_A03;
 		break;
 	case 4:
-		rev = TEGRA_REVISION_A04;
+		tegra_sku_info.revision = TEGRA_REVISION_A04;
 		break;
 	default:
-		rev = TEGRA_REVISION_UNKNOWN;
+		tegra_sku_info.revision = TEGRA_REVISION_UNKNOWN;
 	}
 
-	tegra_sku_info.revision = rev;
-
 	tegra_sku_info.sku_id = tegra_fuse_read_early(FUSE_SKU_INFO);
 }
 
-- 
2.17.1
