From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [RFC 2/9] dt-bindings: add header for generic I2C flags in bindings
Date: Fri, 17 Jul 2015 16:08:22 +0200
Message-ID: <1437142109-31975-3-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
 include/dt-bindings/i2c/i2c.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/i2c/i2c.h

diff --git a/include/dt-bindings/i2c/i2c.h b/include/dt-bindings/i2c/i2c.h
new file mode 100644
index 00000000000000..1d5da81d90f144
--- /dev/null
+++ b/include/dt-bindings/i2c/i2c.h
@@ -0,0 +1,18 @@
+/*
+ * This header provides constants for I2C bindings
+ *
+ * Copyright (C) 2015 by Sang Engineering
+ * Copyright (C) 2015 by Renesas Electronics Corporation
+ *
+ * Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
+ *
+ * GPLv2 only
+ */
+
+#ifndef _DT_BINDINGS_I2C_I2C_H
+#define _DT_BINDINGS_I2C_I2C_H
+
+#define I2C_TEN_BIT_ADDRESS	(1 << 31)
+#define I2C_OWN_SLAVE_ADDRESS	(1 << 30)
+
+#endif
-- 
2.1.4
