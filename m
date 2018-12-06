From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/7] arm64: tegra: Add HDA controller on Tegra186
Date: Thu,  6 Dec 2018 17:50:16 +0100
Message-ID: <20181206165022.23845-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The HDA controller found on Tegra186 can be used for audio playback over
HDMI.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 4c79778d80db..6cea54dc9d35 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -318,6 +318,22 @@
 		status = "disabled";
 	};
 
+	hda@3510000 {
+		compatible = "nvidia,tegra186-hda", "nvidia,tegra30-hda";
+		reg = <0x0 0x03510000 0x0 0x10000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA186_CLK_HDA>,
+			 <&bpmp TEGRA186_CLK_HDA2HDMICODEC>,
+			 <&bpmp TEGRA186_CLK_HDA2CODEC_2X>;
+		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+		resets = <&bpmp TEGRA186_RESET_HDA>,
+			 <&bpmp TEGRA186_RESET_HDA2HDMICODEC>,
+			 <&bpmp TEGRA186_RESET_HDA2CODEC_2X>;
+		reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
+		status = "disabled";
+	};
+
 	fuse@3820000 {
 		compatible = "nvidia,tegra186-efuse";
 		reg = <0x0 0x03820000 0x0 0x10000>;
-- 
2.19.1
