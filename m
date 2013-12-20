From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: tegra: enable USB2 on Tegra30 Beaver
Date: Thu, 19 Dec 2013 18:08:53 -0800
Message-ID: <1387505333-3767-2-git-send-email-ebrower@nvidia.com>
References: <1387505333-3767-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387505333-3767-1-git-send-email-ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable USB2 on Beaver, exposed via the mini-PCIe connector.

Signed-off-by: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: no changes for this patch in the patchset

 arch/arm/boot/dts/tegra30-beaver.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 08cad69..7aef3e1 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -328,6 +328,15 @@
 		non-removable;
 	};
 
+	usb@7d004000 {
+		status = "okay";
+	};
+
+	phy2: usb-phy@7d004000 {
+		vbus-supply = <&sys_3v3_reg>;
+		status = "okay";
+	};
+
 	usb@7d008000 {
 		status = "okay";
 	};
-- 
1.8.1.5
