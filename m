From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 31/37] ARM: tegra: colibri_t20: drop module level model and compatible
Date: Sun,  2 Sep 2018 12:09:00 +0200
Message-ID: <20180902100906.25792-32-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
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

 arch/arm/boot/dts/tegra20-colibri.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 53e06f31dbea..b4d429f672da 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -8,9 +8,6 @@
  * Colibri T20 512MB IT V1.2A
  */
 / {
-	model = "Toradex Colibri T20";
-	compatible = "toradex,colibri_t20", "nvidia,tegra20";
-
 	memory@0 {
 		/*
 		 * Set memory to 256 MB to be safe as this could be used on
-- 
2.14.4
