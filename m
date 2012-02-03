From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 3/3] arm: tegra: dts: Mark USB1 as an OTG port on Seaboard
Date: Fri,  3 Feb 2012 08:56:12 -0800
Message-ID: <1328288172-8059-4-git-send-email-sjg@chromium.org>
References: <1328288172-8059-1-git-send-email-sjg@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1328288172-8059-1-git-send-email-sjg@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Simon Glass <sjg@chromium.org>
List-Id: linux-tegra@vger.kernel.org

The USB1 port on Tegra2 supports operation in host or device modes. On
Seaboard this is possible, so mark the port as OTG.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index 876d5c9..dbf1c5a 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -112,6 +112,7 @@
 
 	usb@c5000000 {
 		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
+		dr_mode = "otg";
 	};
 
 	gpio-keys {
-- 
1.7.7.3
