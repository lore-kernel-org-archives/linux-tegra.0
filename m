From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] arm64: tegra: Enable SMMU translation for PCI on Tegra186
Date: Mon,  6 May 2019 18:34:53 +0200
Message-ID: <20190506163453.3852-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling
bypass by default") intentionally breaks all devices using the SMMU in
bypass mode. This breaks, among other things, PCI support on Tegra186.
Fix this by populating the iommus property and friends for the PCIe
controller.

Fixes: 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling bypass by default")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 3fb60f6f3a93..426ac0bdf6a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -673,6 +673,10 @@
 			 <&bpmp TEGRA186_RESET_PCIEXCLK>;
 		reset-names = "afi", "pex", "pcie_x";
 
+		iommus = <&smmu TEGRA186_SID_AFI>;
+		iommu-map = <0x0 &smmu TEGRA186_SID_AFI 0x1000>;
+		iommu-map-mask = <0x0>;
+
 		status = "disabled";
 
 		pci@1,0 {
-- 
2.21.0
