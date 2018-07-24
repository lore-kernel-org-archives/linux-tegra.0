From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 11/15] ARM: tegra: apalis-tk1: enable emmc ddr52 mode
Date: Tue, 24 Jul 2018 12:43:05 +0200
Message-ID: <20180724104309.21741-12-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add mmc-ddr-1_8v property enabling eMMC DDR52 mode.

root@apalis-tk1-mainline:~# cat /sys/kernel/debug/mmc2/ios
clock:          52000000 Hz
actual clock:   52000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    8 (mmc DDR52)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)
root@apalis-tk1-mainline:~# hdparm -t /dev/mmcblk2

/dev/mmcblk2:
 Timing buffered disk reads: 256 MB in  3.02 seconds =  84.83 MB/sec

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 1 +
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 6c255cb70339..13486fe407d2 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1919,6 +1919,7 @@
 		non-removable;
 		vmmc-supply = <&reg_module_3v3>; /* VCC */
 		vqmmc-supply = <&reg_1v8_vddio>; /* VCCQ */
+		mmc-ddr-1_8v;
 	};
 
 	/* CPU DFLL clock */
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 72253d918ebd..77ca508d755e 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1948,6 +1948,7 @@
 		non-removable;
 		vmmc-supply = <&reg_module_3v3>; /* VCC */
 		vqmmc-supply = <&reg_1v8_vddio>; /* VCCQ */
+		mmc-ddr-1_8v;
 	};
 
 	/* CPU DFLL clock */
-- 
2.14.4
