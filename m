From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] ASoC: dt: Move WM8753 pin list from Tegra board binding to CODEC binding
Date: Sun, 11 Aug 2013 19:02:41 +0100
Message-ID: <1376244161-24206-3-git-send-email-broonie@kernel.org>
References: <1376244161-24206-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376244161-24206-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The pin list is the same for any board using the CODEC.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra-audio-wm8753.txt   | 27 ++--------------------
 Documentation/devicetree/bindings/sound/wm8753.txt | 22 ++++++++++++++++++
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
index d145106..aab6ce0 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
@@ -11,31 +11,8 @@ Required properties:
 - nvidia,audio-routing : A list of the connections between audio components.
   Each entry is a pair of strings, the first being the connection's sink,
   the second being the connection's source. Valid names for sources and
-  sinks are the WM8753's pins, and the jacks on the board:
-
-  WM8753 pins:
-
-  * LOUT1
-  * LOUT2
-  * ROUT1
-  * ROUT2
-  * MONO1
-  * MONO2
-  * OUT3
-  * OUT4
-  * LINE1
-  * LINE2
-  * RXP
-  * RXN
-  * ACIN
-  * ACOP
-  * MIC1N
-  * MIC1
-  * MIC2N
-  * MIC2
-  * Mic Bias
-
-  Board connectors:
+  sinks are the WM8753's pins as documented in the binding for the WM8753,
+  and the jacks on the board:
 
   * Headphone Jack
   * Mic Jack
diff --git a/Documentation/devicetree/bindings/sound/wm8753.txt b/Documentation/devicetree/bindings/sound/wm8753.txt
index 5dbcde0..8eee612 100644
--- a/Documentation/devicetree/bindings/sound/wm8753.txt
+++ b/Documentation/devicetree/bindings/sound/wm8753.txt
@@ -10,6 +10,28 @@ Required properties:
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
 
+Pins on the device (for linking into audio routes):
+
+  * LOUT1
+  * LOUT2
+  * ROUT1
+  * ROUT2
+  * MONO1
+  * MONO2
+  * OUT3
+  * OUT4
+  * LINE1
+  * LINE2
+  * RXP
+  * RXN
+  * ACIN
+  * ACOP
+  * MIC1N
+  * MIC1
+  * MIC2N
+  * MIC2
+  * Mic Bias
+
 Example:
 
 codec: wm8753@1a {
-- 
1.8.4.rc1
