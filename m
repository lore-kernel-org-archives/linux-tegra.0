From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 12/15] ARM: tegra: apalis-tk1: add toradex,apalis-tk1-v1.2 compatible
Date: Tue, 24 Jul 2018 12:43:06 +0200
Message-ID: <20180724104309.21741-13-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add toradex,apalis-tk1-v1.2 compatible.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 Documentation/devicetree/bindings/arm/tegra.txt | 2 ++
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 1073a5e66122..1c90cb32da19 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -51,6 +51,8 @@ board-specific compatible values:
   toradex,apalis_t30-v1.1-eval
   toradex,apalis-tk1
   toradex,apalis-tk1-eval
+  toradex,apalis-tk1-v1.2
+  toradex,apalis-tk1-v1.2-eval
   toradex,colibri_t20-512
   toradex,colibri_t30
   toradex,colibri_t30-eval-v3
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index aafaf2c3e195..89783fe76f65 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -11,7 +11,8 @@
 / {
 	model = "Toradex Apalis TK1 on Apalis Evaluation Board";
 	compatible = "toradex,apalis-tk1-v1.2-eval", "toradex,apalis-tk1-eval",
-		     "toradex,apalis-tk1", "nvidia,tegra124";
+		     "toradex,apalis-tk1-v1.2", "toradex,apalis-tk1",
+		     "nvidia,tegra124";
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
-- 
2.14.4
