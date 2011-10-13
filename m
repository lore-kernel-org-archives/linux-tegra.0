From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] i2c: tegra: __iomem annotation fix
Date: Wed, 12 Oct 2011 17:33:00 -0700
Message-ID: <1318465980-625-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

drivers/i2c/busses/i2c-tegra.c:585:7: warning: incorrect type in assignment (different address spaces)
drivers/i2c/busses/i2c-tegra.c:585:7:    expected void *base
drivers/i2c/busses/i2c-tegra.c:585:7:    got void [noderef] <asn:2>*
drivers/i2c/busses/i2c-tegra.c:619:16: warning: incorrect type in assignment (different address spaces)
drivers/i2c/busses/i2c-tegra.c:619:16:    expected void [noderef] <asn:2>*base
drivers/i2c/busses/i2c-tegra.c:619:16:    got void *base
drivers/i2c/busses/i2c-tegra.c:689:10: warning: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-tegra.c:689:10:    expected void volatile [noderef] <asn:2>*addr
drivers/i2c/busses/i2c-tegra.c:689:10:    got void *base

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b402435..46b6500 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -567,7 +567,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct clk *i2c_clk;
 	const unsigned int *prop;
-	void *base;
+	void __iomem *base;
 	int irq;
 	int ret = 0;
 
-- 
1.7.4.1
