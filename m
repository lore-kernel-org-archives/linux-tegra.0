From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 16/20] arm64: dts: tegra210-p2597: add pinmux for PWM-based
 DFLL support
Date: Tue, 18 Dec 2018 17:12:28 +0800
Message-ID: <20181218091232.23532-17-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add pinmux for PWM-based DFLL support.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - no change
*V2:
 - add ack tag
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a96e6ee70c21..0ee25a5188f8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1278,6 +1278,20 @@
 				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
 			};
 		};
+
+		dvfs_pwm_active_state: dvfs_pwm_active {
+			dvfs_pwm_pbb1 {
+				nvidia,pins = "dvfs_pwm_pbb1";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+		};
+
+		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
+			dvfs_pwm_pbb1 {
+				nvidia,pins = "dvfs_pwm_pbb1";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+		};
 	};
 
 	pwm@7000a000 {
-- 
2.20.1
