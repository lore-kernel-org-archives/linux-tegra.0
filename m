From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/2] dt-bindings: sound: tegra-wm8903: Document built-in microphone audio source
Date: Fri, 20 Mar 2020 23:55:03 +0300
Message-ID: <20200320205504.30466-2-digetx@gmail.com>
References: <20200320205504.30466-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200320205504.30466-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The internal microphone source is needed in order to be able to describe
the hardware audio routing for devices that have the built-in microphone
in addition to the external Mic Jack.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
index b795d282818d..a8f2b0c56c79 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
@@ -18,6 +18,7 @@ Required properties:
   * Headphone Jack
   * Int Spk
   * Mic Jack
+  * Int Mic
 
 - nvidia,i2s-controller : The phandle of the Tegra I2S1 controller
 - nvidia,audio-codec : The phandle of the WM8903 audio codec
-- 
2.25.1
