From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/5] rtc: tegra: cleanups to remove warning/code lines
Date: Mon, 11 Mar 2013 14:14:23 +0530
Message-ID: <1362991468-30226-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series does the cleanups in the rtc driver as follows:
- Protect suspend/resume with CONFIG_PM_SLEEP.
- Use dev_pm_ops in place of legacy way for suspend/resume.
- Properly reflect teh irq name when doing cat /proc/interrupts.
- Use module_platform_probe() to remove boilerplate code.
- use devm_rtc_device_register.

Changes from V1:
- Use SIMPLE_DEV_PM_OPS
- Correctd the acronym case rtc to RTC in description.
- Add Thierry reviewed by on some of patches.

Laxman Dewangan (5):
  rtc: tegra: protect suspend/resume callbacks with CONFIG_PM_SLEEP
  rtc: tegra: Use struct dev_pm_ops for power management
  rtc: tegra: use module_platform_driver_probe for module init/exit
  rtc: tegra: set irq name as device name
  rtc: tegra: use managed rtc_device_register

 drivers/rtc/rtc-tegra.c |   61 +++++++++++-----------------------------------
 1 files changed, 15 insertions(+), 46 deletions(-)
