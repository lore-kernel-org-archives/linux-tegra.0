From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v2 3/4] arm64: tegra: Configure SDIO cards on Jetson AGX Xavier SDMMC1
Date: Thu, 23 Jul 2020 23:09:31 +0200
Message-ID: <20200723210932.8076-4-tszucs@protonmail.ch>
References: <20200723210932.8076-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200723210932.8076-1-tszucs@protonmail.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, JC Kuo <jckuo@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
List-Id: linux-tegra@vger.kernel.org

Preserve SDIO card power during a suspend/resume cycle and enable wake up of
host system on SDIO IRQ assertion.

Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 6c4a19cee34c..156e961a4557 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -60,6 +60,8 @@
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
 			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			keep-power-in-suspend;
+			wakeup-source;
 		};
 
 		/* SDMMC4 (eMMC) */
-- 
2.20.1
