From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 16/19] arm64: dts: tegra210-p2371-2180: enable DFLL clock
Date: Tue, 4 Dec 2018 17:25:45 +0800
Message-ID: <20181204092548.3038-17-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
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

Enable DFLL clock for Jetson TX1 platform.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 37e3c46e753f..53f497c2b3ff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -78,4 +78,24 @@
 			};
 		};
 	};
+
+	clock@70110000 {
+		status = "okay";
+		nvidia,pwm-to-pmic;
+		nvidia,init-uv = <1000000>;
+		nvidia,align-offset-uv = <708000>;
+		nvidia,align-step-uv = <19200>;
+		nvidia,sample-rate = <25000>;
+		nvidia,droop-ctrl = <0x00000f00>;
+		nvidia,force-mode = <1>;
+		nvidia,cf = <6>;
+		nvidia,ci = <0>;
+		nvidia,cg = <2>;
+		nvidia,idle-override;
+		nvidia,one-shot-calibrate;
+		nvidia,pwm-period = <2500>; /* 2.5us */
+		pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
+		pinctrl-0 = <&dvfs_pwm_active_state>;
+		pinctrl-1 = <&dvfs_pwm_inactive_state>;
+	};
 };
-- 
2.19.2
