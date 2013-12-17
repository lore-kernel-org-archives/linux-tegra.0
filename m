From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] gpu: ion: use module_platform_driver to simplify the code
Date: Tue, 17 Dec 2013 11:16:41 +0800
Message-ID: <CAPgLHd9V2FR8sfEG_Q4SQoXgjVP9oRzC14LVZKqC8Lz+VHBjjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/staging/android/ion/tegra/tegra_ion.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/android/ion/tegra/tegra_ion.c b/drivers/staging/android/ion/tegra/tegra_ion.c
index 0849600..4b3d93f 100644
--- a/drivers/staging/android/ion/tegra/tegra_ion.c
+++ b/drivers/staging/android/ion/tegra/tegra_ion.c
@@ -81,16 +81,5 @@ static struct platform_driver ion_driver = {
 	.driver = { .name = "ion-tegra" }
 };
 
-static int __init ion_init(void)
-{
-	return platform_driver_register(&ion_driver);
-}
-
-static void __exit ion_exit(void)
-{
-	platform_driver_unregister(&ion_driver);
-}
-
-module_init(ion_init);
-module_exit(ion_exit);
+module_platform_driver(ion_driver);
 
