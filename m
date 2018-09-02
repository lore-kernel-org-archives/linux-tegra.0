From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 17/37] ARM: tegra: colibri_t20: iris: annotate uarts
Date: Sun,  2 Sep 2018 12:08:46 +0200
Message-ID: <20180902100906.25792-18-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate UART-A and UART-B.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 21713b7ae978..cb3c82287223 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -98,10 +98,12 @@
 		};
 	};
 
+	/* Colibri UART-A */
 	serial@70006000 {
 		status = "okay";
 	};
 
+	/* Colibri UART-B */
 	serial@70006300 {
 		status = "okay";
 	};
-- 
2.14.4
