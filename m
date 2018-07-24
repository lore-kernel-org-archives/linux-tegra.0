From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 10/15] ARM: tegra: apalis-tk1: add proper emmc vmmc and vqmmc supplies
Date: Tue, 24 Jul 2018 12:43:04 +0200
Message-ID: <20180724104309.21741-11-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add proper eMMC vmmc and vqmmc supplies e.g. fixing signalling voltage.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 ++
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 8ea696c91341..6c255cb70339 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1917,6 +1917,8 @@
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
+		vmmc-supply = <&reg_module_3v3>; /* VCC */
+		vqmmc-supply = <&reg_1v8_vddio>; /* VCCQ */
 	};
 
 	/* CPU DFLL clock */
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index ab63e5653d73..72253d918ebd 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1946,6 +1946,8 @@
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
+		vmmc-supply = <&reg_module_3v3>; /* VCC */
+		vqmmc-supply = <&reg_1v8_vddio>; /* VCCQ */
 	};
 
 	/* CPU DFLL clock */
-- 
2.14.4
