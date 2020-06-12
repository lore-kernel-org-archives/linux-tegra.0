From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 32/38] dt-bindings: leds: Document rfkill* trigger
Date: Fri, 12 Jun 2020 16:18:57 +0200
Message-ID: <20200612141903.2391044-33-thierry.reding@gmail.com>
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

LEDs can use rfkill events as a trigger source, so document these in the
device tree bindings.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/leds/common.yaml        | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541bca73c..6619d1ff1031 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -79,24 +79,25 @@ properties:
       the LED.
     $ref: /schemas/types.yaml#definitions/string
 
-    enum:
+    oneOf:
         # LED will act as a back-light, controlled by the framebuffer system
-      - backlight
+      - const: backlight
         # LED will turn on (but for leds-gpio see "default-state" property in
         # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
-      - default-on
+      - const: default-on
         # LED "double" flashes at a load average based rate
-      - heartbeat
+      - const: heartbeat
         # LED indicates disk activity
-      - disk-activity
+      - const: disk-activity
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
-      - ide-disk
+      - const: ide-disk
         # LED flashes at a fixed, configurable rate
-      - timer
+      - const: timer
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
-      - pattern
+      - const: pattern
+      - pattern: "^rfkill[0-9]+$"
 
   led-pattern:
     description: |
-- 
2.24.1
