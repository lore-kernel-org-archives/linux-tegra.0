From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/7] arm64: tegra: Enable native timers on Jetson TX2
Date: Fri, 20 Mar 2020 14:34:50 +0100
Message-ID: <20200320133452.3705040-6-thierry.reding@gmail.com>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200320133452.3705040-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable the native timers on Jetson TX2 to allow using the watchdog
functionality to recover from system hangs, for example.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index da96de04d003..9aa17744c4a0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -58,6 +58,10 @@ memory-controller@2c00000 {
 		status = "okay";
 	};
 
+	timer@3010000 {
+		status = "okay";
+	};
+
 	serial@3100000 {
 		status = "okay";
 	};
-- 
2.24.1
