From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 6/6] ARM: tegra: defconfig: enable HOTPLUG_CPU
Date: Wed, 15 Aug 2012 17:22:34 +0800
Message-ID: <1345022554-26292-7-git-send-email-josephl@nvidia.com>
References: <1345022554-26292-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345022554-26292-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable HOTPLUG_CPU after the SoC specific code to hotplug a CPU
been merged.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index db22453..e16fd61 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -31,6 +31,7 @@ CONFIG_MACH_PAZ00=y
 CONFIG_MACH_TRIMSLICE=y
 CONFIG_TEGRA_EMC_SCALING_ENABLE=y
 CONFIG_SMP=y
+CONFIG_HOTPLUG_CPU=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 # CONFIG_OABI_COMPAT is not set
-- 
1.7.0.4
