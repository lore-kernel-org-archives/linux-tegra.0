From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] pinctrl: tegra114: Remove MODULE_ALIAS
Date: Tue, 10 Sep 2013 18:30:59 +0200
Message-ID: <1378830659-22072-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The driver cannot be built as a module, so having a MODULE_ALIAS() isn't
useful.

While at it, fix a small typo in the file header comment and make the
module description string consistent with those for earlier Tegra SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra114.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra114.c b/drivers/pinctrl/pinctrl-tegra114.c
index 622c485..93c9e38 100644
--- a/drivers/pinctrl/pinctrl-tegra114.c
+++ b/drivers/pinctrl/pinctrl-tegra114.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
  *
- * Arthur:  Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ * Author:  Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -2763,7 +2763,6 @@ static struct platform_driver tegra114_pinctrl_driver = {
 };
 module_platform_driver(tegra114_pinctrl_driver);
 
-MODULE_ALIAS("platform:tegra114-pinctrl");
 MODULE_AUTHOR("Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("NVIDIA Tegra114 pincontrol driver");
+MODULE_DESCRIPTION("NVIDIA Tegra114 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-- 
1.8.4
