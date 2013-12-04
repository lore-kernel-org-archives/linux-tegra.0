From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ASoC: add DT binding document for MAX98090 CODEC
Date: Wed,  4 Dec 2013 15:19:26 -0700
Message-ID: <1386195567-24124-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This binding mainly serves to document the list of input and output pins
that may be used in a sound card's audio routing table.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This series doesn't depend on anything; it could be applied anywhere in
the ASoC tree.

 .../devicetree/bindings/sound/max98090.txt         | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/max98090.txt b/Documentation/devicetree/bindings/sound/max98090.txt
new file mode 100644
index 000000000000..e4c8b36dcf89
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98090.txt
@@ -0,0 +1,43 @@
+MAX98090 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "maxim,max98090".
+
+- reg : The I2C address of the device.
+
+- interrupts : The CODEC's interrupt output.
+
+Pins on the device (for linking into audio routes):
+
+  * MIC1
+  * MIC2
+  * DMICL
+  * DMICR
+  * IN1
+  * IN2
+  * IN3
+  * IN4
+  * IN5
+  * IN6
+  * IN12
+  * IN34
+  * IN56
+  * HPL
+  * HPR
+  * SPKL
+  * SPKR
+  * RCVL
+  * RCVR
+  * MICBIAS
+
+Example:
+
+audio-codec@10 {
+	compatible = "maxim,max98090";
+	reg = <0x10>;
+	interrupt-parent = <&gpio>;
+	interrupts = <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+};
-- 
1.8.1.5
