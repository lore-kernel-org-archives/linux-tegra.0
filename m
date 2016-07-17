From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] serial: tegra20-hsuart: fix typo in dmas DT binding description
Date: Sun, 17 Jul 2016 22:31:21 +0200
Message-ID: <1468787481-27753-1-git-send-email-mirza.krak@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The description for dmas references a second property, which should be
"dma-names" instead of "clock-names".

Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt b/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
index 845850c..c93a2d1 100644
--- a/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
@@ -10,7 +10,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names : Must include the following entries:
   - serial
-- dmas : Must contain an entry for each entry in clock-names.
+- dmas : Must contain an entry for each entry in dma-names.
   See ../dma/dma.txt for details.
 - dma-names : Must include the following entries:
   - rx
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
