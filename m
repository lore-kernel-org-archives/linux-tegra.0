From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 28/31] ARM: tegra: colibri_t20: simplify model and compatible properties
Date: Wed, 29 Aug 2018 10:14:04 +0200
Message-ID: <20180829081407.11304-29-marcel@ziswiler.com>
References: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829081407.11304-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Simplify model and compatible by dropping the 256/512 MB from the model
and -512 from the compatible properties to be more in-line with all our
other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 1204aa9e1d57..d870414e2cb6 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -8,8 +8,8 @@
  * Colibri T20 512MB IT V1.2A
  */
 / {
-	model = "Toradex Colibri T20 256/512 MB";
-	compatible = "toradex,colibri_t20-512", "nvidia,tegra20";
+	model = "Toradex Colibri T20";
+	compatible = "toradex,colibri_t20", "nvidia,tegra20";
 
 	memory@0 {
 		/*
-- 
2.14.4
