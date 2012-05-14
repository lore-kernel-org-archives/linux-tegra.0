From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Fix flow controller accesses
Date: Mon, 14 May 2012 13:27:09 +0300
Message-ID: <1336991229-18859-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

flowctrl_write_cpu_csr uses the cpu halt offsets and vice versa. This patch
fixes this bug.

Reported-by: Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/flowctrl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctrl.c
index fef66a7..f07488e 100644
--- a/arch/arm/mach-tegra/flowctrl.c
+++ b/arch/arm/mach-tegra/flowctrl.c
@@ -53,10 +53,10 @@ static void flowctrl_update(u8 offset, u32 value)
 
 void flowctrl_write_cpu_csr(unsigned int cpuid, u32 value)
 {
-	return flowctrl_update(flowctrl_offset_halt_cpu[cpuid], value);
+	return flowctrl_update(flowctrl_offset_cpu_csr[cpuid], value);
 }
 
 void flowctrl_write_cpu_halt(unsigned int cpuid, u32 value)
 {
-	return flowctrl_update(flowctrl_offset_cpu_csr[cpuid], value);
+	return flowctrl_update(flowctrl_offset_halt_cpu[cpuid], value);
 }
-- 
1.7.7.rc0.72.g4b5ea.dirty
