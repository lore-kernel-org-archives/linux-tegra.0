From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH 1/1] arm64: tegra: enable SDIO on Jetson Nano M.2 Key E
Date: Sat, 12 Oct 2019 09:52:13 +0200
Message-ID: <20191012075213.4880-2-tszucs@protonmail.ch>
References: <20191012075213.4880-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012075213.4880-1-tszucs@protonmail.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
List-Id: linux-tegra@vger.kernel.org

Enable SDMMC3 and set it up for SDIO devices.

Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9d17ec707bce..66f913ba0b1c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -515,6 +515,16 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	sdhci@700b0400 {
+		status = "okay";
+		bus-width = <4>;
+		cap-sdio-irq;
+		non-removable;
+
+		vqmmc-supply = <&vdd_1v8>;
+		vmmc-supply = <&vdd_3v3_sys>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.20.1
