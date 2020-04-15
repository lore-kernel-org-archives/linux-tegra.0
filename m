From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] drm/tegra: Clean up GPIO includes
Date: Wed, 15 Apr 2020 14:24:27 +0200
Message-ID: <20200415122427.111769-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra DRM drivers includes the legacy GPIO headers
<linux/gpio.h> and <linux/of_gpio.h> but what it really
uses is <linux/gpio/consumer.h> since only gpio_desc
structs are ever referenced.

Include the right header on the top level tegra/drm.h
file and drop all the surplus includes.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 2 --
 drivers/gpu/drm/tegra/drm.h   | 2 +-
 drivers/gpu/drm/tegra/hdmi.c  | 1 -
 drivers/gpu/drm/tegra/sor.c   | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 7dfb50f65067..105fb9cdbb3b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -5,12 +5,10 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..bf0512177e8f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -9,7 +9,7 @@
 
 #include <linux/host1x.h>
 #include <linux/iova.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 38252c0f068d..94fb0193fa3d 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/hdmi.h>
 #include <linux/math64.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..b010826e86da 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
-#include <linux/gpio.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-- 
2.25.2
