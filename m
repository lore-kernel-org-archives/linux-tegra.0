From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH V2] ARM64: tegra: Add chosen node for tegra132 norrin
Date: Mon, 25 Jan 2016 20:25:55 +0000
Message-ID: <1453753555-14634-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The NVIDIA bootloader, nvtboot, expects the "chosen" node to be present
in the device-tree blob and if it is not then it fails to boot the kernel.
Add the chosen node so we can boot the kernel on Tegra132 Norrin with the
nvtboot bootloader.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v1 -> v2 changes:
- minor fixes to commit message

Ideally, we would like to get this into v4.5 as a fix for Tegra132 Norrin
so that we can enable booting this board as part of our automated testing
setup for Tegra [0][1]. Thierry suggested I send this directly as a fix
to ARM-SOC. Let me know if this is ok. I have not included a "fixes" as it
may not be needed for all bootloaders, but if you need this we could put:

Fixes: 0f279eb arm64: tegra: Add NVIDIA Tegra132 Norrin support

[0] http://nvtb.github.io/linux/
[1] http://nvtb.github.io/linux-next/

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 7dfe1c085966..62f33fc84e3e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -12,6 +12,8 @@
 		rtc1 = "/rtc@0,7000e000";
 	};
 
+	chosen { };
+
 	memory {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
-- 
2.1.4
