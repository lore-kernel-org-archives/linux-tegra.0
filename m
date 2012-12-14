From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=202/3=5D=20ARM=3A=20tegra=3A=20use=20new=20EMC=20clock=20scaling=20API=20in=20CPUfreq=20driver?=
Date: Fri, 14 Dec 2012 21:14:45 +0100
Message-ID: <1355516086-11116-3-git-send-email-dev@lynxeye.de>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355516086-11116-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The CPUfreq driver should not take control of EMC clock directly, but
rather let the EMC driver know about the CPUs memory performance demand=
s
using the new EMC clock scaling API.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 arch/arm/mach-tegra/cpu-tegra.c | 15 ++++++++-------
 1 Datei ge=C3=A4ndert, 8 Zeilen hinzugef=C3=BCgt(+), 7 Zeilen entfernt=
(-)

diff --git a/arch/arm/mach-tegra/cpu-tegra.c b/arch/arm/mach-tegra/cpu-=
tegra.c
index a74d3c7..8908e32 100644
--- a/arch/arm/mach-tegra/cpu-tegra.c
+++ b/arch/arm/mach-tegra/cpu-tegra.c
@@ -29,6 +29,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/suspend.h>
+#include <memory/tegra_emc_performance.h>
=20
 /* Frequency table index must be sequential starting at 0 */
 static struct cpufreq_frequency_table freq_table[] =3D {
@@ -117,16 +118,16 @@ static int tegra_update_cpu_speed(unsigned long r=
ate)
 	if (freqs.old =3D=3D freqs.new)
 		return ret;
=20
-	/*
-	 * Vote on memory bus frequency based on cpu frequency
-	 * This sets the minimum frequency, display or avp may request higher
-	 */
+	/* Boost memory bus frequency based on CPU frequency */
 	if (rate >=3D 816000)
-		clk_set_rate(emc_clk, 600000000); /* cpu 816 MHz, emc max */
+		tegra_emc_request_perf_level(TEGRA_EMC_SC_MPCORE,
+					     TEGRA_EMC_PL_HIGH);
 	else if (rate >=3D 456000)
-		clk_set_rate(emc_clk, 300000000); /* cpu 456 MHz, emc 150Mhz */
+		tegra_emc_request_perf_level(TEGRA_EMC_SC_MPCORE,
+					     TEGRA_EMC_PL_MID);
 	else
-		clk_set_rate(emc_clk, 100000000);  /* emc 50Mhz */
+		tegra_emc_request_perf_level(TEGRA_EMC_SC_MPCORE,
+					     TEGRA_EMC_PL_LOW);
=20
 	for_each_online_cpu(freqs.cpu)
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
--=20
1.7.11.7
