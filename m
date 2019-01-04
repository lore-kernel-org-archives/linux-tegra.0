From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH] arm64: dts: tegra210-smaug: fix IRQ type of PMIC
Date: Fri, 4 Jan 2019 15:16:45 +0800
Message-ID: <20190104071646.15828-2-josephl@nvidia.com>
References: <20190104071646.15828-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104071646.15828-1-josephl@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix IRQ type of PMIC which should be configured as high-level trigger.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index c08c5471b974..5a67890cfb7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1362,7 +1362,7 @@
 		max77620: max77620@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-			interrupts = <0 86 IRQ_TYPE_NONE>;
+			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
2.20.1
