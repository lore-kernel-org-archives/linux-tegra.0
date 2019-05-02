From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix insecure SMMU users for Tegra186
Date: Thu, 2 May 2019 14:27:21 +0100
Message-ID: <1556803641-22305-1-git-send-email-jonathanh@nvidia.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Jonathan Hunter <jonathanh@nvidia.com>

Commit 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling
bypass by default") intentionally breaks all devices using the SMMU in
bypass mode. This is breaking various devices on Tegra186 which include
the ethernet, BPMP and HDA device. Fix this by populating the SMMU node
for these devices with their stream ID.

Fixes: 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling bypass by default")

Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index f0bb6ced4976..3fb60f6f3a93 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -60,6 +60,7 @@
 		clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 		resets = <&bpmp TEGRA186_RESET_EQOS>;
 		reset-names = "eqos";
+		iommus = <&smmu TEGRA186_SID_EQOS>;
 		status = "disabled";
 
 		snps,write-requests = <1>;
@@ -338,6 +339,7 @@
 			 <&bpmp TEGRA186_RESET_HDA2CODEC_2X>;
 		reset-names = "hda", "hda2hdmi", "hda2codec_2x";
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
+		iommus = <&smmu TEGRA186_SID_HDA>;
 		status = "disabled";
 	};
 
@@ -1158,6 +1160,7 @@
 
 	bpmp: bpmp {
 		compatible = "nvidia,tegra186-bpmp";
+		iommus = <&smmu TEGRA186_SID_BPMP>;
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
 				    TEGRA_HSP_DB_MASTER_BPMP>;
 		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
-- 
1.9.1
