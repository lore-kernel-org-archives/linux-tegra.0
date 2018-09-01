From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 15/34] ARM: tegra: colibri_t30: add proper emmc vmmc and vqmmc supplies
Date: Sat,  1 Sep 2018 10:12:29 +0200
Message-ID: <20180901081248.22639-16-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add proper eMMC vmmc and vqmmc supplies e.g. fixing signalling voltage.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 670edd5e4754..c5cb05f78604 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -931,6 +931,8 @@
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
+		vmmc-supply = <&reg_module_3v3>; /* VCC */
+		vqmmc-supply = <&reg_1v8_vio>; /* VCCQ */
 	};
 
 	/* EHCI instance 1: USB2_DP/N -> AX88772B */
-- 
2.14.4
