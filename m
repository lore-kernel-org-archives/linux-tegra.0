From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 07/10] arm64: defconfig: Enable Tegra186 SoC
Date: Tue, 5 Jul 2016 17:04:28 +0800
Message-ID: <20160705090431.5852-8-josephl@nvidia.com>
References: <20160705090431.5852-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160705090431.5852-1-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Matthew Longnecker <MLongnecker@nvidia.com>, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable Tegra186 SoC.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
Changes in V2:
- None
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e69051098435..64d767ec142c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -326,6 +326,7 @@ CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_ARCH_TEGRA_132_SOC=y
+CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_PWM=y
-- 
2.9.0
