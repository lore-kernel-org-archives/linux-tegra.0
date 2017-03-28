From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add CPU and PSCI nodes for NVIDIA Tegra210
 platforms
Date: Tue, 28 Mar 2017 12:48:38 +0100
Message-ID: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@nvidia.com>
Cc: devicetree@vger.kernel.org, Vagrant Cascadian <vagrant@debian.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Martin Michlmayr <tbm@cyrius.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Add the CPU and PSCI nodes for the NVIDIA Tegra210 platforms so that
all CPUs can be enabled on boot. This assumes that the PSCI firmware
has been loaded during the initial bootstrap on the device before the
kernel starts (which is typically the case for these platforms). The
PSCI firmware version is set to v0.2 which aligns with the current
shipping version for Tegra.

Reported-by: Martin Michlmayr <tbm@cyrius.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 906fb836d241..de1696c28140 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -296,6 +296,29 @@
 		};
 	};
 
+	cpus {
+		cpu@0 {
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 	regulators {
 		vdd_gpu: regulator@100 {
 			compatible = "pwm-regulator";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index 0ec92578cacb..67cb039965fd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -51,4 +51,28 @@
 			clock-frequency = <32768>;
 		};
 	};
+
+	cpus {
+		cpu@0 {
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 };
-- 
2.7.4
