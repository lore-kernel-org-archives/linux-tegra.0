From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/3] ALSA: hda/tegra: property for card name
Date: Wed, 20 Feb 2019 20:43:22 +0530
Message-ID: <1550675604-14788-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

An optional property "nvidia,model" is introduced for hda to pass custom
name for the sound card. The suffix "-hda" in the name passed is useful
to distinguish between multiple cards available for a platform.
When the property is not specified, default name("tegra-hda") mentioned
in hda driver is used. This property can be added in platform specific
file of the board and card name can relate to the board in use.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
index 44d2745..21cd310 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
@@ -13,6 +13,10 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
 
+Optional properties:
+- nvidia,model : The user-visible name of this sound complex. Since the property
+  is optional, legacy boards can use default name provided in hda driver.
+
 Example:
 
 hda@70030000 {
@@ -27,4 +31,5 @@ hda@70030000 {
 		 <&tegra_car 128>, /* hda2hdmi */
 		 <&tegra_car 111>; /* hda2codec_2x */
 	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+	nvidia,model = "jetson-tk1-hda";
 };
-- 
2.7.4
