From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 7/9] tegra: i2c: Select I2C ordering for Seaboard
Date: Fri,  3 Feb 2012 17:13:58 -0800
Message-ID: <1328318041-10943-8-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

 board/nvidia/dts/tegra2-seaboard.dts |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index f00341f..95fb561 100644
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
@@ -44,4 +49,20 @@
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
+
+	i2c@7000d000 {
+		clock-frequency = <100000>;
+	};
 };
-- 
1.7.7.3
