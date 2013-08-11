From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] ASoC: dt: Move RT5640 pin list from Tegra board binding to CODEC binding
Date: Sun, 11 Aug 2013 19:02:40 +0100
Message-ID: <1376244161-24206-2-git-send-email-broonie@kernel.org>
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
 .../bindings/sound/nvidia,tegra-audio-rt5640.txt   | 25 ++--------------------
 Documentation/devicetree/bindings/sound/rt5640.txt | 20 +++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
index d130818..cba4f88 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
@@ -11,29 +11,8 @@ Required properties:
 - nvidia,audio-routing : A list of the connections between audio components.
   Each entry is a pair of strings, the first being the connection's sink,
   the second being the connection's source. Valid names for sources and
-  sinks are the RT5640's pins, and the jacks on the board:
-
-  RT5640 pins:
-
-  * DMIC1
-  * DMIC2
-  * MICBIAS1
-  * IN1P
-  * IN1R
-  * IN2P
-  * IN2R
-  * HPOL
-  * HPOR
-  * LOUTL
-  * LOUTR
-  * MONOP
-  * MONON
-  * SPOLP
-  * SPOLN
-  * SPORP
-  * SPORN
-
-  Board connectors:
+  sinks are the RT5640's pins (as documented in its binding), and the jacks
+  on the board:
 
   * Headphones
   * Speakers
diff --git a/Documentation/devicetree/bindings/sound/rt5640.txt b/Documentation/devicetree/bindings/sound/rt5640.txt
index 005bcb2..068a114 100644
--- a/Documentation/devicetree/bindings/sound/rt5640.txt
+++ b/Documentation/devicetree/bindings/sound/rt5640.txt
@@ -18,6 +18,26 @@ Optional properties:
 
 - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
 
+Pins on the device (for linking into audio routes):
+
+  * DMIC1
+  * DMIC2
+  * MICBIAS1
+  * IN1P
+  * IN1R
+  * IN2P
+  * IN2R
+  * HPOL
+  * HPOR
+  * LOUTL
+  * LOUTR
+  * MONOP
+  * MONON
+  * SPOLP
+  * SPOLN
+  * SPORP
+  * SPORN
+
 Example:
 
 rt5640 {
-- 
1.8.4.rc1
