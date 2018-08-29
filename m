From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 29/31] ARM: tegra: colibri_t20: iris: simplify model and compatible properties
Date: Wed, 29 Aug 2018 10:14:05 +0200
Message-ID: <20180829081407.11304-30-marcel@ziswiler.com>
References: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829081407.11304-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Simplify model and compatible by dropping the 256/512 MB from the model,
-512 from the compatible and rename that property from toradex,iris to
toradex,colibri_t20-iris to be more in-line with all our other device
trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 955d1e1ad8e0..3bcbb74edf2a 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -5,8 +5,9 @@
 #include "tegra20-colibri.dtsi"
 
 / {
-	model = "Toradex Colibri T20 256/512 MB on Iris";
-	compatible = "toradex,iris", "toradex,colibri_t20-512", "nvidia,tegra20";
+	model = "Toradex Colibri T20 on Iris";
+	compatible = "toradex,colibri_t20-iris", "toradex,colibri_t20",
+		     "nvidia,tegra20";
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
-- 
2.14.4
