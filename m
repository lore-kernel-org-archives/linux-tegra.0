From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 3/9] Documentation: DT bindings: fix hda2codec_2x clock name for tegra30-hda
Date: Fri, 10 Apr 2015 23:35:58 +0200
Message-ID: <ee8e9952dfdfd87da52f817fca0a6ad94a137742.1428700856.git.marcel.ziswiler@toradex.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Matt Porter <mporter@linaro.org>, Paul Walmsley <paul@pwsan.com>, Eduardo Valentin <edubezval@gmail.com>, Takashi Iwai <tiwai@suse.de>, Dylan Reid <dgreid@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix hda2codec_2x clock name in Tegra30 HDA controller device tree node
documentation.
While at it also fix coma vs. semicolon issue.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
index 13e2ef4..5032efa 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
@@ -8,10 +8,10 @@ Required properties:
 - interrupts : The interrupt from the HDA controller.
 - clocks : Must contain an entry for each required entry in clock-names.
   See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries: hda, hdacodec_2x, hda2hdmi
+- clock-names : Must include the following entries: hda, hda2codec_2x, hda2hdmi
 - resets : Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
-- reset-names : Must include the following entries: hda, hdacodec_2x, hda2hdmi
+- reset-names : Must include the following entries: hda, hda2codec_2x, hda2hdmi
 
 Example:
 
@@ -24,7 +24,7 @@ hda@0,70030000 {
 		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
 	clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 	resets = <&tegra_car 125>, /* hda */
-		 <&tegra_car 128>; /* hda2hdmi */
-		 <&tegra_car 111>, /* hda2codec_2x */
+		 <&tegra_car 128>, /* hda2hdmi */
+		 <&tegra_car 111>; /* hda2codec_2x */
 	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
 };
-- 
1.9.3
