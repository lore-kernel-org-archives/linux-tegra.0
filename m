From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] soc/tegra: fuse: fix build break due to missing linux/module.h
 include
Date: Thu, 4 Jun 2015 07:28:48 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1506040728080.12316@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


tegra_defconfig builds are broken on next-20150603:

----
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]
----

This is due to the intersection of commit
436b6428b9cc97f61721f335eb9d8010751a337e ("soc/tegra: fuse: Unify
Tegra20 and Tegra30 drivers") and commit
5ebbb3badaa8ffc50558af88cdea27497953356a ("module: relocate
module_init from init.h to module.h") in the linux-next tree.

Fix by replacing the linux/kernel.h include in
drivers/soc/tegra/fuse/fuse-tegra.c with a linux/module.h include.

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index daba1894bb1a..de2c1bfe28b5 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -18,7 +18,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/kobject.h>
-#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
2.1.4
