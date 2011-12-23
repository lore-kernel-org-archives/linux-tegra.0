From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 8/9] arm/tegra: seaboard: add EMC table to device tree
Date: Thu, 22 Dec 2011 16:17:47 -0800
Message-ID: <1324599468-12845-9-git-send-email-olof@lixom.net>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324599468-12845-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Timings for the T25 version of seaboard, only one memory manufacturer
and timing table (two speeds).

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |   38 ++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index b55a02e..7ccf67e 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -93,4 +93,42 @@
 			gpio-key,wakeup;
 		};
 	};
+
+	emc@7000f400 {
+		emc-table@190000 {
+			reg = < 190000 >;
+			compatible = "nvidia,tegra20-emc-table";
+			clock-frequency = < 190000 >;
+			nvidia,emc-registers = < 0x0000000c 0x00000026
+				0x00000009 0x00000003 0x00000004 0x00000004
+				0x00000002 0x0000000c 0x00000003 0x00000003
+				0x00000002 0x00000001 0x00000004 0x00000005
+				0x00000004 0x00000009 0x0000000d 0x0000059f
+				0x00000000 0x00000003 0x00000003 0x00000003
+				0x00000003 0x00000001 0x0000000b 0x000000c8
+				0x00000003 0x00000007 0x00000004 0x0000000f
+				0x00000002 0x00000000 0x00000000 0x00000002
+				0x00000000 0x00000000 0x00000083 0xa06204ae
+				0x007dc010 0x00000000 0x00000000 0x00000000
+				0x00000000 0x00000000 0x00000000 0x00000000 >;
+		};
+
+		emc-table@380000 {
+			reg = < 380000 >;
+			compatible = "nvidia,tegra20-emc-table";
+			clock-frequency = < 380000 >;
+			nvidia,emc-registers = < 0x00000017 0x0000004b
+				0x00000012 0x00000006 0x00000004 0x00000005
+				0x00000003 0x0000000c 0x00000006 0x00000006
+				0x00000003 0x00000001 0x00000004 0x00000005
+				0x00000004 0x00000009 0x0000000d 0x00000b5f
+				0x00000000 0x00000003 0x00000003 0x00000006
+				0x00000006 0x00000001 0x00000011 0x000000c8
+				0x00000003 0x0000000e 0x00000007 0x0000000f
+				0x00000002 0x00000000 0x00000000 0x00000002
+				0x00000000 0x00000000 0x00000083 0xe044048b
+				0x007d8010 0x00000000 0x00000000 0x00000000
+				0x00000000 0x00000000 0x00000000 0x00000000 >;
+		};
+	};
 };
-- 
1.7.8.GIT
