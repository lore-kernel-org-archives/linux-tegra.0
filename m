From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] ASoC: dt: Move ALC5632 pin list from Tegra board binding to CODEC binding
Date: Sun, 11 Aug 2013 19:02:39 +0100
Message-ID: <1376244161-24206-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The pin list is the same for any board using the CODEC.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/sound/alc5632.txt          | 20 ++++++++++++++++++
 .../bindings/sound/nvidia,tegra-audio-alc5632.txt  | 24 ++--------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt b/Documentation/devicetree/bindings/sound/alc5632.txt
index 8608f74..b913b74 100644
--- a/Documentation/devicetree/bindings/sound/alc5632.txt
+++ b/Documentation/devicetree/bindings/sound/alc5632.txt
@@ -13,6 +13,26 @@ Required properties:
   - #gpio-cells : Should be two. The first cell is the pin number and the
     second cell is used to specify optional parameters (currently unused).
 
+Pins on the device (for linking into audio routes):
+
+  * SPK_OUTP
+  * SPK_OUTN
+  * HP_OUT_L
+  * HP_OUT_R
+  * AUX_OUT_P
+  * AUX_OUT_N
+  * LINE_IN_L
+  * LINE_IN_R
+  * PHONE_P
+  * PHONE_N
+  * MIC1_P
+  * MIC1_N
+  * MIC2_P
+  * MIC2_N
+  * MICBIAS1
+  * DMICDAT
+
+
 Example:
 
 alc5632: alc5632@1e {
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
index 05ffecb..8b8903e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
@@ -11,28 +11,8 @@ Required properties:
 - nvidia,audio-routing : A list of the connections between audio components.
   Each entry is a pair of strings, the first being the connection's sink,
   the second being the connection's source. Valid names for sources and
-  sinks are the ALC5632's pins:
-
-  ALC5632 pins:
-
-  * SPK_OUTP
-  * SPK_OUTN
-  * HP_OUT_L
-  * HP_OUT_R
-  * AUX_OUT_P
-  * AUX_OUT_N
-  * LINE_IN_L
-  * LINE_IN_R
-  * PHONE_P
-  * PHONE_N
-  * MIC1_P
-  * MIC1_N
-  * MIC2_P
-  * MIC2_N
-  * MICBIAS1
-  * DMICDAT
-
-  Board connectors:
+  sinks are the ALC5632's pins as documented in the binding for the device
+  and:
 
   * Headset Stereophone
   * Int Spk
-- 
1.8.4.rc1
