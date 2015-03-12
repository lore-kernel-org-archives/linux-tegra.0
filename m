From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v8 18/18] memory: tegra: Disable ARBITRATION_EMEM interrupt
Date: Thu, 12 Mar 2015 15:48:10 +0100
Message-ID: <1426171746-26864-19-git-send-email-tomeu.vizoso@collabora.com>
References: <1426171746-26864-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426171746-26864-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

As this interrupt is just for development purposes, as the TRM says, and
the sheer amount of interrupts fired can seriously disrupt userspace
when testing the lower frequencies supported by the EMC.

From the TRM:

"There is one performance warning type interrupt: ARBITRATION_EMEM. It
fires when the MC detects that a request has been pending in the Row
Sorter long enough to hit the DEADLOCK_PREVENTION_SLACK_THRESHOLD. In
addition to true performance problems, this interrupt may fire in
situations such as clock-change where the EMC backpressures pending
traffic for long periods of time. This interrupt helps developers
identify and debug performance issues and configuration issues."

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/memory/tegra/mc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 4e3a886..19f6774 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -409,8 +409,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 
 	value = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
 		MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
-		MC_INT_ARBITRATION_EMEM | MC_INT_SECURITY_VIOLATION |
-		MC_INT_DECERR_EMEM;
+		MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM;
+
 	mc_writel(mc, value, MC_INTMASK);
 
 	return 0;
-- 
2.1.0
