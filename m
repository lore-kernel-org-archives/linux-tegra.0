From: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 2/4] dt-bindings: sram: add documentation for reserved-only flag
Date: Tue, 12 May 2020 16:48:01 +0200
Message-ID: <20200512144803.24344-2-ykaukab@suse.de>
References: <20200512144803.24344-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200512144803.24344-1-ykaukab-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add documentation for the new optional flag added for SRAM driver.

Signed-off-by: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 19d116ff9ddc..4bcc309fa841 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -55,6 +55,12 @@ properties:
       as write combining. WC is used by default.
     type: boolean
 
+  reserved-only:
+    description:
+      The flag indicating, that only SRAM reserved regions have to be remapped.
+      remapping type is selected depending upon no-memory-wc as usual.
+    type: boolean
+
 patternProperties:
   "^([a-z]*-)?sram(-section)?@[a-f0-9]+$":
     type: object
-- 
2.25.0
