From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] arm/tegra: Fix section mismatch errors in tegra20 pinmux
Date: Mon, 19 Dec 2011 11:01:57 -0700
Message-ID: <1324317718-24464-2-git-send-email-swarren@nvidia.com>
References: <1324317718-24464-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324317718-24464-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra20_pinmux_init() is called from the pinmux's probe() function, and
hence should be __devinit not __init.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pinmux-tegra20-tables.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/pinmux-tegra20-tables.c b/arch/arm/mach-tegra/pinmux-tegra20-tables.c
index 0fe5335..734add1 100644
--- a/arch/arm/mach-tegra/pinmux-tegra20-tables.c
+++ b/arch/arm/mach-tegra/pinmux-tegra20-tables.c
@@ -232,7 +232,7 @@ static const struct tegra_pingroup_desc tegra_soc_pingroups[TEGRA_MAX_PINGROUP]
 	PINGROUP(XM2D,  DDR,   RSVD,      RSVD,      RSVD,      RSVD,          RSVD,      -1,   -1, -1,   -1, 0xA8, 28),
 };
 
-void __init tegra20_pinmux_init(const struct tegra_pingroup_desc **pg,
+void __devinit tegra20_pinmux_init(const struct tegra_pingroup_desc **pg,
 		int *pg_max, const struct tegra_drive_pingroup_desc **pgdrive,
 		int *pgdrive_max)
 {
-- 
1.7.0.4
