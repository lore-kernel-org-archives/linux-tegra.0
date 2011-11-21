From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] arm/dt: tegra: Fix SDHCI nodes to match board files
Date: Mon, 21 Nov 2011 14:44:11 -0700
Message-ID: <1321911851-10091-5-git-send-email-swarren@nvidia.com>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321911851-10091-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark any SDHCI controllers that aren't registered by the board files as
disabled in the device-tree files.

In practice, these controllers:

* Have nothing hooked up to them at all, or
* For ports intended for SDIO usage, the drivers for anything that might
  be attached are not in the device-tree yet. If/when drivers appear, the
  SD/MMC port can be re-enabled.

The only possible exception is TrimSlice's mico SD slot, but that wasn't
enabled in the board files before anyway, and doesn't work when all the
SDHCI controllers are enabled anyway.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-harmony.dts   |    8 ++++++++
 arch/arm/boot/dts/tegra-seaboard.dts  |    8 ++++++++
 arch/arm/boot/dts/tegra-trimslice.dts |   12 ++++++++++++
 arch/arm/boot/dts/tegra-ventana.dts   |    8 ++++++++
 4 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index ac179a0..80afa1b 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -67,12 +67,20 @@
 		status = "disable";
 	};
 
+	sdhci@c8000000 {
+		status = "disable";
+	};
+
 	sdhci@c8000200 {
 		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
 		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
 		power-gpios = <&gpio 155 0>; /* gpio PT3 */
 	};
 
+	sdhci@c8000400 {
+		status = "disable";
+	};
+
 	sdhci@c8000600 {
 		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
 		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index cbb2f08..f552bcc 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -47,6 +47,14 @@
 		status = "disable";
 	};
 
+	sdhci@c8000000 {
+		status = "disable";
+	};
+
+	sdhci@c8000200 {
+		status = "disable";
+	};
+
 	sdhci@c8000400 {
 		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
 		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
index 6060ce0..3b3ee7d 100644
--- a/arch/arm/boot/dts/tegra-trimslice.dts
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -46,6 +46,18 @@
 		status = "disable";
 	};
 
+	sdhci@c8000000 {
+		status = "disable";
+	};
+
+	sdhci@c8000200 {
+		status = "disable";
+	};
+
+	sdhci@c8000400 {
+		status = "disable";
+	};
+
 	sdhci@c8000600 {
 		cd-gpios = <&gpio 121 0>;
 		wp-gpios = <&gpio 122 0>;
diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
index 5ac0aa3..c7d3b87 100644
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@ -46,6 +46,14 @@
 		status = "disable";
 	};
 
+	sdhci@c8000000 {
+		status = "disable";
+	};
+
+	sdhci@c8000200 {
+		status = "disable";
+	};
+
 	sdhci@c8000400 {
 		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
 		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
-- 
1.7.0.4
