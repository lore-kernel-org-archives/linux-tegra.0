From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 5/6] arm64: tegra: Enable GPIO controllers nodes for
 P2972-0000 platform
Date: Fri, 22 Nov 2019 16:15:04 +0530
Message-ID: <20191122104505.8986-6-vidyas@nvidia.com>
References: <20191122104505.8986-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191122104505.8986-1-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: devicetree@vger.kernel.org, mmaddireddy@nvidia.com, kthota@nvidia.com, gustavo.pimentel@synopsys.com, linux-kernel@vger.kernel.org, kishon@ti.com, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, vidyas@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Enable GPIO controllers nodes for P2972-0000 platform which are required
by other controllers in the SoC for example when PCIe C5 controller
operates in endpoint mode.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 353a6a22196d..7eb64b816e08 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -37,6 +37,14 @@
 			status = "okay";
 		};
 
+		gpio@2200000 {
+			status = "okay";
+		};
+
+		gpio@c2f0000 {
+			status = "okay";
+		};
+
 		pwm@c340000 {
 			status = "okay";
 		};
-- 
2.17.1
