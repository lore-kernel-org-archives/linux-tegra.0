From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH] arm64: dts: tegra210: fix register range of apbmisc
Date: Fri, 4 Jan 2019 15:16:44 +0800
Message-ID: <20190104071646.15828-1-josephl@nvidia.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix the register range of apbmisc, that originally inherited from
Tegra124.

Reported-by: Mark Zhang <markz@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index e2baf52fe1af..b5858b5ea052 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -470,7 +470,7 @@
 	apbmisc@70000800 {
 		compatible = "nvidia,tegra210-apbmisc", "nvidia,tegra20-apbmisc";
 		reg = <0x0 0x70000800 0x0 0x64>,   /* Chip revision */
-		      <0x0 0x7000e864 0x0 0x04>;   /* Strapping options */
+		      <0x0 0x70000008 0x0 0x04>;   /* Strapping options */
 	};
 
 	pinmux: pinmux@700008d4 {
-- 
2.20.1
