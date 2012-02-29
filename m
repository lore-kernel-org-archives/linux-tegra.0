From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 7/9] tegra: i2c: Select I2C ordering for Seaboard
Date: Wed, 29 Feb 2012 09:31:27 -0800
Message-ID: <1330536689-9121-8-git-send-email-sjg@chromium.org>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330536689-9121-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Select the port ordering for I2C on Seaboard.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Disable port 2 as it is not used

Changes in v3:
- Move speed setting from tegra20.dtsi to board .dts file

Changes in v4:
- Add to existing i2c node for the DVC peripheral

 board/nvidia/dts/tegra2-seaboard.dts |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index ad8169a..6ba3ec4 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -15,6 +15,11 @@
 		/* This defines the order of our USB ports */
 		usb0 = "/usb@c5008000";
 		usb1 = "/usb@c5000000";
+
+		i2c0 = "/i2c@7000d000";
+		i2c1 = "/i2c@7000c000";
+		i2c2 = "/i2c@7000c400";
+		i2c3 = "/i2c@7000c500";
 	};
 
 	memory {
@@ -24,6 +29,7 @@
 
 	/* This is not used in U-Boot, but is expected to be in kernel .dts */
 	i2c@7000d000 {
+		clock-frequency = <100000>;
 		pmic@34 {
 			compatible = "ti,tps6586x";
 			reg = <0x34>;
@@ -71,4 +77,16 @@
 	usb@c5004000 {
 		status = "disabled";
 	};
+
+	i2c@7000c000 {
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000c400 {
+		status = "disabled";
+	};
+
+	i2c@7000c500 {
+		clock-frequency = <100000>;
+	};
 };
-- 
1.7.7.3
