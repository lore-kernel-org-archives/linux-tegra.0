From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 13/37] ARM: tegra: colibri_t20: update sound nvidia,model
Date: Sun,  2 Sep 2018 12:08:42 +0200
Message-ID: <20180902100906.25792-14-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Update sound nvidia,model to be more in-line with our other device
trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 5559008efc5f..ba84184e09b8 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -507,7 +507,7 @@
 	sound {
 		compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
 			     "nvidia,tegra-audio-wm9712";
-		nvidia,model = "Colibri T20 AC97 Audio";
+		nvidia,model = "Toradex Colibri T20";
 		nvidia,audio-routing =
 			"Headphone", "HPOUTL",
 			"Headphone", "HPOUTR",
-- 
2.14.4
