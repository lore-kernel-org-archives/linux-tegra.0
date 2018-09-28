From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 5/5] arm64: dts: tegra210: Add power-domains for xHCI
Date: Fri, 28 Sep 2018 15:11:50 +0100
Message-ID: <1538143910-24400-6-git-send-email-jonathanh@nvidia.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Populate the power-domain properties for the xHCI device for Tegra210.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 8fe47d6445a5..2205d66b0443 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -879,6 +879,8 @@
 		resets = <&tegra_car 89>, <&tegra_car 156>,
 			 <&tegra_car 143>;
 		reset-names = "xusb_host", "xusb_ss", "xusb_src";
+		power-domains = <&pd_xusbhost>, <&pd_xusbss>;
+		power-domain-names = "xusb_host", "xusb_ss";
 
 		nvidia,xusb-padctl = <&padctl>;
 
-- 
2.7.4
