From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 22/38] dt-bindings: gpio: tegra186: Use unique include guard
Date: Fri, 12 Jun 2020 16:18:47 +0200
Message-ID: <20200612141903.2391044-23-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This header file can be included from the same source or DTS files as
the existing dt-bindings/gpio/tegra-gpio.h header, so make sure its
include guard is unique.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/dt-bindings/gpio/tegra186-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/tegra186-gpio.h b/include/dt-bindings/gpio/tegra186-gpio.h
index 0782b05e2775..af0d9583be70 100644
--- a/include/dt-bindings/gpio/tegra186-gpio.h
+++ b/include/dt-bindings/gpio/tegra186-gpio.h
@@ -8,8 +8,8 @@
  * The second cell contains standard flag values specified in gpio.h.
  */
 
-#ifndef _DT_BINDINGS_GPIO_TEGRA_GPIO_H
-#define _DT_BINDINGS_GPIO_TEGRA_GPIO_H
+#ifndef _DT_BINDINGS_GPIO_TEGRA186_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA186_GPIO_H
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.24.1
