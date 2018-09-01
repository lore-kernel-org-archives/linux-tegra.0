From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 26/34] ARM: tegra: colibri_t30: drop module level model and compatible
Date: Sat,  1 Sep 2018 10:12:40 +0200
Message-ID: <20180901081248.22639-27-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop model and compatible nodes from the module level device tree as
they get overridden by the carrier board device tree anyway.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch as suggested by Rob.

 arch/arm/boot/dts/tegra30-colibri.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 9bd7034b8e66..f4aee43402d1 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -6,9 +6,6 @@
  * Compatible for Revisions V1.1B, V1.1C, V1.1D, V1.1E, V1.1F; IT: V1.1A, V1.1B
  */
 / {
-	model = "Toradex Colibri T30";
-	compatible = "toradex,colibri_t30", "nvidia,tegra30";
-
 	memory@80000000 {
 		reg = <0x80000000 0x40000000>;
 	};
-- 
2.14.4
