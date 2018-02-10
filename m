From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 4/4] ARM: dts: tegra: venice2: remove duplicate pcie-1 node
Date: Sat, 10 Feb 2018 02:33:25 +0100
Message-ID: <20180210013326.27771-5-marcel@ziswiler.com>
References: <20180210013326.27771-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180210013326.27771-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Get rid of duplicate pcie-1 node.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-venice2.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index c0469ea149d2..89bcc178994d 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -956,11 +956,6 @@
 						nvidia,function = "usb3-ss";
 						status = "okay";
 					};
-
-					pcie-1 {
-						nvidia,function = "usb3-ss";
-						status = "okay";
-					};
 				};
 			};
 		};
-- 
2.14.3
