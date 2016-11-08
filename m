From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] bus: tegra-gmi: fix build error
Date: Tue,  8 Nov 2016 14:50:29 +0100
Message-ID: <20161108135058.1991567-1-arnd@arndb.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The newly added driver fails to build right away:

drivers/bus/tegra-gmi.c: In function 'tegra_gmi_parse_dt':
drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

I guess a last-minute change removed a local variable, this
adds the obvious definiton.

Fixes: 4f95e6a5c9e4 ("bus: Add support for Tegra Generic Memory Interface")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/bus/tegra-gmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index 44ee73186c5e..8b6ab0dd2f4c 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -90,9 +90,10 @@ static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
 {
 	struct device_node *child;
 	u32 property, ranges[4];
+	struct device *dev = gmi->dev;
 	int err;
 
-	child = of_get_next_available_child(gmi->dev->of_node, NULL);
+	child = of_get_next_available_child(dev->of_node, NULL);
 	if (!child) {
 		dev_err(dev, "no child nodes found\n");
 		return -ENODEV;
-- 
2.9.0
