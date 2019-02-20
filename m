From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: custom name for hda sound card
Date: Wed, 20 Feb 2019 20:43:23 +0530
Message-ID: <1550675604-14788-2-git-send-email-spujar@nvidia.com>
References: <1550675604-14788-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550675604-14788-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

"nvidia,model" property is added to pass custom name for hda sound card.
This is parsed in hda driver and used for card name. This aligns with the
way with which sound cards are named in general.

This patch populates above for jetson-tx1, jetson-tx2 and jetson-xavier.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 0f3c6ce..31457f3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -54,6 +54,7 @@
 	};
 
 	hda@3510000 {
+		nvidia,model = "jetson-tx2-hda";
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 34a7044..b62e969 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -21,6 +21,7 @@
 		};
 
 		hda@3510000 {
+			nvidia,model = "jetson-xavier-hda";
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 8780b5b..95e890d8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1323,6 +1323,7 @@
 	};
 
 	hda@70030000 {
+		nvidia,model = "jetson-tx1-hda";
 		status = "okay";
 	};
 
-- 
2.7.4
