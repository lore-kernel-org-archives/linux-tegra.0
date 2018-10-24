From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] arm64: tegra: Add PWM fan support on Jetson Xavier
Date: Wed, 24 Oct 2018 17:33:53 +0200
Message-ID: <20181024153353.15745-2-thierry.reding@gmail.com>
References: <20181024153353.15745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181024153353.15745-1-thierry.reding@gmail.com>
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
Cc: Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable PWM4 in device tree and use it to drive the PWM fan on the Jetson
Xavier.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 9ff3c18280c4..86f05504ca38 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -12,5 +12,14 @@
 		sdhci@3400000 {
 			status = "okay";
 		};
+
+		pwm@c340000 {
+			status = "okay";
+		};
+	};
+
+	fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm4 0 45334>;
 	};
 };
-- 
2.19.1
