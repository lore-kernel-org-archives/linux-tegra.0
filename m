From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH 3/5] ASoC: Tegra+ALC5632 machine: Add device tree binding documentation
Date: Tue, 31 Jan 2012 09:30:40 +0200
Message-ID: <1327995040-27152-1-git-send-email-leon@leon.nu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document device tree binding for the tegra board with ALC5632 codec
according to datasheet functional block description.

Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 .../bindings/sound/tegra-audio-alc5632.txt         |   57 ++++++++++++++++++++
 1 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt

diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
new file mode 100644
index 0000000..300f2da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
@@ -0,0 +1,57 @@
+NVIDIA Tegra audio complex
+
+Required properties:
+- compatible : "nvidia,tegra-audio-alc5632"
+- nvidia,model : The user-visible name of this sound complex.
+- nvidia,audio-routing : A list of the connections between audio components.
+  Each entry is a pair of strings, the first being the connection's sink,
+  the second being the connection's source. Valid names for sources and
+  sinks are the ALC5632's pins:
+
+  ALC5632 pins:
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
+
+  Board connectors:
+
+  * Headset Stereophone
+  * Int Spk
+  * Headset Mic
+
+- nvidia,i2s-controller : The phandle of the Tegra I2S controller
+- nvidia,audio-codec : The phandle of the ALC5632 audio codec
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-alc5632-paz00",
+				 "nvidia,tegra-audio-alc5632";
+
+	nvidia,model = "Compal PAZ00";
+
+	nvidia,audio-routing =
+				"Int Spk", "SPK_OUTP",
+				"Int Spk", "SPK_OUTN",
+				"Headset Mic","MICBIAS1",
+				"MIC1_N", "Headset Mic",
+				"MIC1_P", "Headset Mic",
+				"Headset Stereophone", "HP_OUT_R",
+				"Headset Stereophone", "HP_OUT_L";
+
+	nvidia,i2s-controller = <&tegra_i2s1>;
+	nvidia,audio-codec = <&alc5632>;
+};
-- 
1.7.3.4
