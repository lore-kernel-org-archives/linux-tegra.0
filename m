From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 5/6] arm64: tegra: Update the Tegra132 flowctrl compatible
 string
Date: Tue, 28 Mar 2017 13:42:57 +0100
Message-ID: <1490704978-22906-6-git-send-email-jonathanh@nvidia.com>
References: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Russell King <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Update the Tegra132 flowctrl compatible string to include
"nvidia,tegra132-flowctrl" so it is aligned with the flowctrl binding
documentation.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 3f3a46a4bd01..2b17936ac5be 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -224,7 +224,7 @@
 	};
 
 	flow-controller@60007000 {
-		compatible = "nvidia,tegra124-flowctrl";
+		compatible = "nvidia,tegra132-flowctrl", "nvidia,tegra124-flowctrl";
 		reg = <0x0 0x60007000 0x0 0x1000>;
 	};
 
-- 
2.7.4
