From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 17/21] arm64: tegra: Add xudc node for Tegra186
Date: Mon, 10 Feb 2020 13:41:43 +0530
Message-ID: <1581322307-11140-18-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra186 has one XUSB device mode controller, which can be operated
HS and SS modes. Add DT entry for XUSB device mode controller.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2-V5:
 - No changes in this version
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index c905527..58100fb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -572,6 +572,25 @@
 		nvidia,xusb-padctl = <&padctl>;
 	};
 
+	usb@3550000 {
+		compatible = "nvidia,tegra186-xudc";
+		reg = <0x0 0x03550000 0x0 0x8000>,
+		      <0x0 0x03558000 0x0 0x1000>;
+		reg-names = "base", "fpci";
+		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA186_CLK_XUSB_CORE_DEV>,
+			 <&bpmp TEGRA186_CLK_XUSB_SS>,
+			 <&bpmp TEGRA186_CLK_XUSB_CORE_SS>,
+			 <&bpmp TEGRA186_CLK_XUSB_FS>;
+		clock-names = "dev", "ss", "ss_src", "fs_src";
+		iommus = <&smmu TEGRA186_SID_XUSB_DEV>;
+		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_XUSBB>,
+				<&bpmp TEGRA186_POWER_DOMAIN_XUSBA>;
+		power-domain-names = "dev", "ss";
+		nvidia,xusb-padctl = <&padctl>;
+		status = "disabled";
+	};
+
 	fuse@3820000 {
 		compatible = "nvidia,tegra186-efuse";
 		reg = <0x0 0x03820000 0x0 0x10000>;
-- 
2.7.4
