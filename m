From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 2/3] pinctrl: tegra: clean up modular vs. non-modular distinctions
Date: Mon, 22 May 2017 16:56:47 -0400
Message-ID: <20170522205648.23545-3-paul.gortmaker@windriver.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522205648.23545-1-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

None of the Kconfigs for any of these drivers are tristate,
meaning that they currently are not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the drivers there is no doubt they are builtin-only.  All
drivers get similar changes, so they are handled in batch.

We remove module.h from code that isn't doing anything modular at
all;  if they have __init sections, then replace it with init.h.

A couple drivers have module_exit() code that is essentially orphaned,
and so we remove that.

Quite a few bool drivers (hence non-modular) are converted over to
to builtin_platform_driver().

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    |  1 -
 drivers/pinctrl/tegra/pinctrl-tegra114.c | 11 ++++-------
 drivers/pinctrl/tegra/pinctrl-tegra124.c | 11 ++++-------
 drivers/pinctrl/tegra/pinctrl-tegra20.c  | 11 ++++-------
 drivers/pinctrl/tegra/pinctrl-tegra210.c |  9 ++-------
 drivers/pinctrl/tegra/pinctrl-tegra30.c  | 11 ++++-------
 6 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 277622b4b6fb..51716819129d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -21,7 +21,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/machine.h>
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 952132ce5ea0..56b33fca1bfc 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1,6 +1,8 @@
 /*
  * Pinctrl data for the NVIDIA Tegra114 pinmux
  *
+ * Author: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ *
  * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -13,7 +15,7 @@
  * more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1857,7 +1859,6 @@ static const struct of_device_id tegra114_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,tegra114-pinmux", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, tegra114_pinctrl_of_match);
 
 static struct platform_driver tegra114_pinctrl_driver = {
 	.driver = {
@@ -1866,8 +1867,4 @@ static struct platform_driver tegra114_pinctrl_driver = {
 	},
 	.probe = tegra114_pinctrl_probe,
 };
-module_platform_driver(tegra114_pinctrl_driver);
-
-MODULE_AUTHOR("Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("NVIDIA Tegra114 pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(tegra114_pinctrl_driver);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index bca239e3ae50..7bc998ace0d5 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -1,6 +1,8 @@
 /*
  * Pinctrl data for the NVIDIA Tegra124 pinmux
  *
+ * Author: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ *
  * Copyright (c) 2013-2014, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -13,7 +15,7 @@
  * more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -2069,7 +2071,6 @@ static const struct of_device_id tegra124_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,tegra124-pinmux", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, tegra124_pinctrl_of_match);
 
 static struct platform_driver tegra124_pinctrl_driver = {
 	.driver = {
@@ -2078,8 +2079,4 @@ static struct platform_driver tegra124_pinctrl_driver = {
 	},
 	.probe = tegra124_pinctrl_probe,
 };
-module_platform_driver(tegra124_pinctrl_driver);
-
-MODULE_AUTHOR("Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("NVIDIA Tegra124 pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(tegra124_pinctrl_driver);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index ad62451a5a9b..7e38ee9bae78 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -1,6 +1,8 @@
 /*
  * Pinctrl data for the NVIDIA Tegra20 pinmux
  *
+ * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ *
  * Copyright (c) 2011-2012, NVIDIA CORPORATION.  All rights reserved.
  *
  * Derived from code:
@@ -17,7 +19,7 @@
  * more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -2246,9 +2248,4 @@ static struct platform_driver tegra20_pinctrl_driver = {
 	},
 	.probe = tegra20_pinctrl_probe,
 };
-module_platform_driver(tegra20_pinctrl_driver);
-
-MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("NVIDIA Tegra20 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, tegra20_pinctrl_of_match);
+builtin_platform_driver(tegra20_pinctrl_driver);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 2b70e93da9db..c244e5b17bd6 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -13,7 +13,7 @@
  * more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1573,7 +1573,6 @@ static const struct of_device_id tegra210_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,tegra210-pinmux", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, tegra210_pinctrl_of_match);
 
 static struct platform_driver tegra210_pinctrl_driver = {
 	.driver = {
@@ -1582,8 +1581,4 @@ static struct platform_driver tegra210_pinctrl_driver = {
 	},
 	.probe = tegra210_pinctrl_probe,
 };
-module_platform_driver(tegra210_pinctrl_driver);
-
-MODULE_AUTHOR("NVIDIA");
-MODULE_DESCRIPTION("NVIDIA Tegra210 pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(tegra210_pinctrl_driver);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 474ac6daf513..1f180a20f2ab 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -1,6 +1,8 @@
 /*
  * Pinctrl data for the NVIDIA Tegra30 pinmux
  *
+ * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ *
  * Copyright (c) 2011-2012, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -13,7 +15,7 @@
  * more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -2492,7 +2494,6 @@ static const struct of_device_id tegra30_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,tegra30-pinmux", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, tegra30_pinctrl_of_match);
 
 static struct platform_driver tegra30_pinctrl_driver = {
 	.driver = {
@@ -2501,8 +2502,4 @@ static struct platform_driver tegra30_pinctrl_driver = {
 	},
 	.probe = tegra30_pinctrl_probe,
 };
-module_platform_driver(tegra30_pinctrl_driver);
-
-MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("NVIDIA Tegra30 pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(tegra30_pinctrl_driver);
-- 
2.11.0
