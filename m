From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: dt: tegra{20,30}.dtsi: Rename "MC" to "Memory Controller"
Date: Wed, 16 May 2012 09:53:45 +0300
Message-ID: <1337151226-7266-1-git-send-email-hdoyu@nvidia.com>
References: <20120516095107.3510cb39d0f9cd2527e0bf1e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120516095107.3510cb39d0f9cd2527e0bf1e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use a more plain english name.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    2 +-
 arch/arm/boot/dts/tegra30.dtsi |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index d1e6e24..e22c69f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -218,7 +218,7 @@
 		reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
 	};
 
-	mc {
+	memory-controller {
 		compatible = "nvidia,tegra20-mc";
 		reg = <0x7000f000 0x024
 		       0x7000f03c 0x3c4>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index e9792ac..d845d31 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -230,7 +230,7 @@
 		reg = <0x6000c004 0x14c>; /* AHB Arbitration + Gizmo Controller */
 	};
 
-	mc {
+	memory-controller {
 		compatible = "nvidia,tegra30-mc";
 		reg = <0x7000f000 0x010
 		       0x7000f03c 0x1b4
-- 
1.7.5.4
