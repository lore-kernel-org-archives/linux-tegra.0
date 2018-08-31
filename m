From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] ARM: dts: tegra30: fix xcvr-setup-use-fuses
Date: Fri, 31 Aug 2018 14:42:33 +0200
Message-ID: <20180831124233.27156-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

There was a dot instead of a comma. Fix this.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 1de10f0d1da7..d2b553f76719 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -896,7 +896,7 @@
 		nvidia,elastic-limit = <16>;
 		nvidia,term-range-adj = <6>;
 		nvidia,xcvr-setup = <51>;
-		nvidia.xcvr-setup-use-fuses;
+		nvidia,xcvr-setup-use-fuses;
 		nvidia,xcvr-lsfslew = <1>;
 		nvidia,xcvr-lsrslew = <1>;
 		nvidia,xcvr-hsslew = <32>;
@@ -933,7 +933,7 @@
 		nvidia,elastic-limit = <16>;
 		nvidia,term-range-adj = <6>;
 		nvidia,xcvr-setup = <51>;
-		nvidia.xcvr-setup-use-fuses;
+		nvidia,xcvr-setup-use-fuses;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
 		nvidia,xcvr-hsslew = <32>;
@@ -969,7 +969,7 @@
 		nvidia,elastic-limit = <16>;
 		nvidia,term-range-adj = <6>;
 		nvidia,xcvr-setup = <51>;
-		nvidia.xcvr-setup-use-fuses;
+		nvidia,xcvr-setup-use-fuses;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
 		nvidia,xcvr-hsslew = <32>;
-- 
2.14.4
