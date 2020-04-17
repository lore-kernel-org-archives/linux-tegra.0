From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] soc/tegra: fuse: Update the SoC revision attribute to display a name
Date: Fri, 17 Apr 2020 13:40:46 +0100
Message-ID: <20200417124046.26400-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Currently the SoC revision attribute for Tegra devices displays the
value of the enum associated with a particular revision. This is not
very useful because to obtain the actual revision you need to
use the tegra_revision enumeration to translate the value.

It is more meaningful to display a name for the revision, such as
'A01', than the enumarated value and therefore, update the revision
attribute to display a name. This change does alter the ABI, which
is unfortunate, but this is more meaningful and maintable.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index db65ddb6a5d2..d1f8dd0289e6 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -363,7 +363,8 @@ struct device * __init tegra_soc_device_register(void)
 		return NULL;
 
 	attr->family = kasprintf(GFP_KERNEL, "Tegra");
-	attr->revision = kasprintf(GFP_KERNEL, "%d", tegra_sku_info.revision);
+	attr->revision = kasprintf(GFP_KERNEL, "%s",
+		tegra_revision_name[tegra_sku_info.revision]);
 	attr->soc_id = kasprintf(GFP_KERNEL, "%u", tegra_get_chip_id());
 	attr->custom_attr_group = fuse->soc->soc_attr_group;
 
-- 
2.17.1
