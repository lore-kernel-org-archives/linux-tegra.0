From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] gpu: ion: fix sparse non static symbol warnings
Date: Tue, 17 Dec 2013 11:20:22 +0800
Message-ID: <CAPgLHd--f=-3mRqezqwxi7QjWVW2cVY4CmJJvZYsZRoLyXZ95w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Fixes the following sparse warnings:

drivers/staging/android/ion/tegra/tegra_ion.c:23:19: warning:
 symbol 'idev' was not declared. Should it be static?
drivers/staging/android/ion/tegra/tegra_ion.c:24:19: warning:
 symbol 'tegra_user_mapper' was not declared. Should it be static?
drivers/staging/android/ion/tegra/tegra_ion.c:25:5: warning:
 symbol 'num_heaps' was not declared. Should it be static?
drivers/staging/android/ion/tegra/tegra_ion.c:26:17: warning:
 symbol 'heaps' was not declared. Should it be static?
drivers/staging/android/ion/tegra/tegra_ion.c:28:5: warning:
 symbol 'tegra_ion_probe' was not declared. Should it be static?
drivers/staging/android/ion/tegra/tegra_ion.c:66:5: warning:
 symbol 'tegra_ion_remove' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/staging/android/ion/tegra/tegra_ion.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/android/ion/tegra/tegra_ion.c b/drivers/staging/android/ion/tegra/tegra_ion.c
index 0849600..b3c4707 100644
--- a/drivers/staging/android/ion/tegra/tegra_ion.c
+++ b/drivers/staging/android/ion/tegra/tegra_ion.c
@@ -20,12 +20,11 @@
 #include "../ion.h"
 #include "../ion_priv.h"
 
-struct ion_device *idev;
-struct ion_mapper *tegra_user_mapper;
-int num_heaps;
-struct ion_heap **heaps;
+static struct ion_device *idev;
+static int num_heaps;
+static struct ion_heap **heaps;
 
-int tegra_ion_probe(struct platform_device *pdev)
+static int tegra_ion_probe(struct platform_device *pdev)
 {
 	struct ion_platform_data *pdata = pdev->dev.platform_data;
 	int err;
@@ -63,7 +62,7 @@ err:
 	return err;
 }
 
-int tegra_ion_remove(struct platform_device *pdev)
+static int tegra_ion_remove(struct platform_device *pdev)
 {
 	struct ion_device *idev = platform_get_drvdata(pdev);
 	int i;
