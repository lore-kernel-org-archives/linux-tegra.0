From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 5/9] ARM: tegra: fix hda2codec_2x clock name in Tegra124 device tree
Date: Fri, 10 Apr 2015 23:36:00 +0200
Message-ID: <4d791b76e1b363b2446a2b6a6bfb84869d9f94e8.1428700856.git.marcel.ziswiler@toradex.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Matt Porter <mporter@linaro.org>, Paul Walmsley <paul@pwsan.com>, Eduardo Valentin <edubezval@gmail.com>, Takashi Iwai <tiwai@suse.de>, Dylan Reid <dgreid@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index fefec80..095d326 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -620,11 +620,11 @@
 		clocks = <&tegra_car TEGRA124_CLK_HDA>,
 		         <&tegra_car TEGRA124_CLK_HDA2HDMI>,
 			 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
-		clock-names = "hda", "hda2hdmi", "hdacodec_2x";
+		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 		resets = <&tegra_car 125>, /* hda */
 			 <&tegra_car 128>, /* hda2hdmi */
 			 <&tegra_car 111>; /* hda2codec_2x */
-		reset-names = "hda", "hda2hdmi", "hdacodec_2x";
+		reset-names = "hda", "hda2hdmi", "hda2codec_2x";
 		status = "disabled";
 	};
 
-- 
1.9.3
